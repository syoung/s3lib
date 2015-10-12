use MooseX::Declare;

class BankAccount {
    has 'balance' => ( isa => 'Num', is => 'rw', default => 0 );

    method deposit (Num $amount) {
        $self->balance( $self->balance + $amount );
    }

    method withdraw (Num $amount) {
        my $current_balance = $self->balance();
        ( $current_balance >= $amount )
            || confess "Account overdrawn";
        $self->balance( $current_balance - $amount );
    }
}

class CheckingAccount extends BankAccount {
    has 'overdraft_account' => ( isa => 'BankAccount', is => 'rw' );

    before withdraw (Num $amount) {
        my $overdraft_amount = $amount - $self->balance();
        if ( $self->overdraft_account && $overdraft_amount > 0 ) {
            $self->overdraft_account->withdraw($overdraft_amount);
            $self->deposit($overdraft_amount);
        }
    }
}

#package BankAccount;
#  use Moose;
#
#  has 'balance' => ( isa => 'Int', is => 'rw', default => 0 );
#
#  sub deposit {
#      my ( $self, $amount ) = @_;
#      $self->balance( $self->balance + $amount );
#  }
#
#  sub withdraw {
#      my ( $self, $amount ) = @_;
#      my $current_balance = $self->balance();
#      ( $current_balance >= $amount )
#          || confess "Account overdrawn";
#      $self->balance( $current_balance - $amount );
#  }
#
#  package CheckingAccount;
#  use Moose;
#
#  extends 'BankAccount';
#
#  has 'overdraft_account' => ( isa => 'BankAccount', is => 'rw' );
#
#  before 'withdraw' => sub {
#      my ( $self, $amount ) = @_;
#      my $overdraft_amount = $amount - $self->balance();
#      if ( $self->overdraft_account && $overdraft_amount > 0 ) {
#          $self->overdraft_account->withdraw($overdraft_amount);
#          $self->deposit($overdraft_amount);
#      }
#  };