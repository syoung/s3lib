del = {
    ERROR_IMAGE: '<img src="/static/img/error_small.gif" height="13" width="13" />',
    LOADING_IMAGE: '<img class="loadingSpinner" src="/static/img/ajax-loader.gif" height="16" width="16" />',
    LOADING_DIV: '<div align="center"><img class="loadingSpinner" src="/static/img/ajax-loader.gif" height="16" width="16" /></div>',
    VALID_IMAGE: '<img src="/static/img/check_small.gif" height="15" width="15" />',
    STACK_DESCRIPTION_PLACEHOLDER: 'add your description here',
    // TODO: Needs copy revision
    ERROR_TITLE_TEXT: 'YOU BROKE THE INTERWEBS! (just kidding, it is probably our fault.)',
    // TODO: Needs copy revision
    SEPARATE_TAGS_TEXT: 'Delicious is using commas to separate tags now. Do you want your tags separated?',
    ADD_LINKS_PLACEHOLDER: 'add link',
    ADD_SLICE_PLACEHOLDER: 'add a custom text item to your stack',
    ENTER_LINK_PLACEHOLDER: 'enter a url',
    FORGOT_PASSWORD_PLACEHOLDER: 'enter username',
    // TODO: Needs copy revision
    DELETE_USER_PROMPT: 'Are you sure you want to deactivate your account? Your profile, links, and stacks will be removed.',
    PUBLIC_STACK_WARNING: 'Warning: stacks are public, so your link will be visible.',
    EXPORT_DIV: '<div align="center">export done</div>',
    SHARE_TITLE_TRUNCATION_LENGTH: 40,
    NOT_LOGGED_IN_CODE: -1,
    PRIVATE_LINKS_WARNING: 'you have selected one or more private links to add to a stack. your stack will become public when it is published. continue?',
    NO_COMMON_TAGS: 'no common tags found in the bookmarks you selected.',

    init: function(){
		// new ajax modal  
		$().ready(function() {
			var t = $('#modal .modalContent');
				$('#modal').jqm({
			trigger: '.modalTrigger',
			ajax: '@href',
			onHide: function(h) { 
				h.o.remove(); // remove overlay
  				h.w.fadeOut(888); // hide window
  				},
			modal: true,
			toTop: true,
			target:t});

				// Close Button Highlighting. IE doesn't support :hover. Surprise?
				$('input.jqmdX')
					.hover(
				function(){ $(this).addClass('jqmdXFocus'); }, 
				function(){ $(this).removeClass('jqmdXFocus'); })
					.focus( 
				function(){ this.hideFocus=true; $(this).addClass('jqmdXFocus'); })
					.blur( 
				function(){ $(this).removeClass('jqmdXFocus'); });

		});
        $('#stackCreateModalSubmitBtn').live('click', function() {
            var title = $('#stackCreateModalTitleInput').val();
            $('#delLoading').show();
            del.createStack(title, null, null, function(data) {
                if(data.error){
                    del.displayError(data.error_msg);
                } else{
                    var md5s = del.getCheckedLinks();
                    var stackId = data.stack_id;
                    var encStackId = data.enc_stack_id;
                    del.callAddLinksToStack(stackId, md5s, function(stacksAddData) {
                        $('#delLoading').hide();
                        window.location.href = '/stacks/view/' + encStackId + '?editMode=true';
                    }, false);
                }
            }, false);

            return false;
        });
        $('#stackCreateModalForm').live('submit', function() {
            $('#stackCreateModalSubmitBtn').click();
            return false;
        });
        $('body').keyup(function(event){

            // The .saveDialog is used in two places. So here if we
            // receive an enter, we use the dialog box's title to 
            // determine whether we are in the resetSave or saveConfirm
            // page. Once we know that, finding the proper button and
            // click is straight-forward. 
            if($('.saveDialog').is(':visible')){
                if (event.keyCode == 27){
                    $('.saveDialog').fadeOut();
                }
                else if (event.keyCode == 13){
                    if($('.saveDialog .saveBody h2').html() === 
                        'add link details' && 
                        $('#saveNotes').is(':focus') === false) {
                       $('#saveConfirmUpdate').click();
                   } else {
                       $('#oneClickSave').click();
                   } 
                }
            }
            else if($('.savePage').is(':visible')){
                if (event.keyCode == 13 && $('#saveNotes').is(':focus') === false
                    && $('#newTagsInput').is(':focus') === false){
                   $('#saveConfirmUpdate').click();
                }
            }
            if($('.saveDialog').is(':visible') || $('.savePage').is(':visible')){
                // character counter code
                var charsLeft = 1000 - $('#saveNotes').val().length;
                $('#charCount').html(charsLeft + ' characters left');
                if(charsLeft < 0){
                    $('#charCount').html('too many characters!');
                }
            }
        });
        $('#saveButtonNav').click(function() {
            if(!$('#saveDialog0').is(':visible')){
                del.resetSaveDialog($('#saveDialog0 .saveBody'));
            }
            $('#saveDialog0').toggle();
            return false;
        });
        $('.login').ready(function() {
        	if($('#firstInput').val() == '')
        		{
        	$('#firstInput').focus();
        	}
        });
        $('#feedSaveBtn, #feedStackemBtn, #feedShareBtn, #feedDeleteBtn').live("click", function() {
            var $button = $(this);
            var buttonId = $button.attr("id");
            var checked_links = $('#feed_table input:checked');
            if(checked_links.length > 0) {
                var urls = del.getCheckedUrls(checked_links);
                if(buttonId == 'feedSaveBtn') {
                    del.quickSave(urls, '0', $button, function() {
                        checked_links.each(function() {
                            $(this).attr('checked', false);
                        });
                    });
                } else if(buttonId == 'feedStackemBtn') {
                    window.location.href = '/create?urls=' + urls;
                } else if(buttonId == 'feedShareBtn') {

                } else if(buttonId == 'feedDeleteBtn') {
                    del.deleteLinks(urls, $button, function() {
                        $('#tabSection li.active:first a').click();
                    });
                }
            } else {
                del.okDialog("choose some links first");
            }
            return false;
        });
        $('#sendForgot').click(function() {
            $('#forgotPasswordError').hide();
            var usernameOrEmail = $('#usernameEmail').val();

            if (!usernameOrEmail || usernameOrEmail == del.FORGOT_PASSWORD_PLACEHOLDER) {
                $('#forgotPasswordError').show().html('Please enter a username.');
            }
            else {
                var sendForgotContainer = $(this).closest('.btn-container');
                var prevHtml = sendForgotContainer.html();
                $(this).closest('.btn-container').html(del.LOADING_IMAGE);
                $.ajax({
                    url: '/forgot_pw/' + usernameOrEmail,
                    type: 'POST',
                    success: function(data) {
                        if (data.error) {
                            $('#forgotPasswordError').show().html(data.error_msg);
                        }
                        else if (data.success) {
                            $('#forgotPasswordSuccess').show().html('An email with instructions for resetting your password has been sent.');
                        }
                    },
                    error: function(xhr) {
                        del.displayError(xhr.responseText);
                    },
                    complete: function(){
                        sendForgotContainer.html(prevHtml);
                    }
                });
            }
            return false;
        });
        $('#resetPasswordSubmit').click(function(){
            var userId = $('#resetId').val();
            var resetPasswordLink = $('#resetPwdLink').val();
            var newPassword = $('#resetNewPassword').val();
            var newPasswordRetry = $('#resetNewPasswordRetry').val();
            if(!newPassword || !newPasswordRetry){
                del.okDialog('password cannot be blank.');
            }
            else{
                var buttonContainer = $(this).closest('.btn-container');
                var prevHtml = buttonContainer.html();
                buttonContainer.html(del.LOADING_IMAGE);
                $.ajax({
                    url: '/settings/passwordresetemail',
                    type: 'POST',
                    data: {'userid' : userId,
                        'newpassword' : newPassword,
                        'password_retry' : newPasswordRetry,
                        'resetPwdLink' : resetPasswordLink
                    },
                    success: function(data){
                        if(data.error){
                            del.displayError(data.error_msg);
                        }
                        else{
                            window.location.href = '/settings/pw/success';
                        }
                    },
                    error: function(xhr){
                        del.displayError(xhr.responseText);
                    },
                    finish: function(){
                        buttonContainer.html(prevHtml);
                    }
                });
            }
            return false;
        });
        $('.cleanJobButton').click(function(event){
            event.preventDefault();
            var job_id = $(this).parent().parent().children().children().filter('a').attr('href');
            $.ajax({
                type: "POST",
                url: '/admin/job/cleanup',
                data: {
                    job_id: job_id
                },
                success: function(result){
                    if(result == 'True'){
                        window.location.reload();
                    }
                    else{
                        alert('Uh oh, something happened!');
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                }
            });
        });
        $('.rerunJobButton').click(function(event){
            event.preventDefault();
            var job_id = $(this).parent().parent().children().children().filter('a').attr('href');
            $.ajax({
                type: "POST",
                url: '/admin/job/rerun',
                data: {
                    job_id: job_id
                },
                success: function(result){
                    if(result == 'True'){
                        window.location.reload();
                    }
                    else{
                        alert('Uh oh, something happened!');
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                }
            });
        });
        $('#addLinkerLink').click(function(event){
            event.preventDefault();
            $('#addLinker').slideToggle();
            if($(this).text() == 'add links'){
                $(this).text('hide');
            }
            else{
                $(this).text('add links');
            }
        });
        $('#saveBookmark').click(function() {
            $('.saveDialog').show();
            return false;
        });
        /*$('#saveConfirmEdit, .saveConfirmHide').live('click', function(){
            if($('#jump').val() == 'doclose'){
                window.close();
            }
            else{
                $(this).closest('.saveBody').find('.saveEdit').slideToggle('fast');
            }
            return false;
        });*/
        $('#saveConfirmUpdate').live('click', function(){
            var backUrl = $('#backUrl').val();
            if(backUrl && backUrl.length > 0){
                del.saveBookmark(backUrl, $(this));
            }
            else{
                del.saveBookmark(null, $(this));
            }
            return false;
        });
        $('.saveConfirmClose').live('click', function(){
            if($('#jump').val() == 'doclose' || $('#jump').val() == 'close'){
                window.close();
            }
            else{
                $(this).closest('.saveDialog').fadeOut('fast');
                $('.saveBody').html('');
            }
            return false;
        });
        $('#shareDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 470,
            modal: true,
            show: "drop",
            hide: "drop",
            zIndex: 5000,
            buttons: [{
                text: 'cancel',
                click: function() {
                    $('#shareDialog').dialog('close');
                }
            }, {
                text: 'share',
                click: function() {
                    var $this = $(this);
                    var recipients = $('#shareReceiver').val();
                    var message = $('#shareMessage').val();
                    var url = $this.data('url');
                    // if we happen to know the which stack the link is enclosed in
                    var enc_stack_id = $('#enc_stack_id').val();
                    var csrf_token = $('#csrf_token').val();
                    var stack_id = $this.data('stack_id');

                    if(!recipients){
                        del.okDialog('please enter who you would like to share this stack with.');
                    }
                    else {
                        if(stack_id != null && stack_id != undefined && $.trim(stack_id).length > 0) {
                            del.shareStack(stack_id, recipients, message, csrf_token);
                        } else {
                            del.shareLink(url, enc_stack_id, recipients, message, csrf_token);
                        }
                    }
                }
            }],
            open: function(){
                $('#recentShares').hide();
                $('#shareMessage').val('');
                $('#shareRecentRecipients').selectBox('value', $("#shareRecentRecipients option:first").val());
                $('#shareDialog').parent().find('button:contains("cancel")').addClass('cancel');
                del.populate_recent_shares();
            }
        });
       	    $('#removeDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 560,
            modal: true,
            zIndex: 5000,
            buttons: [{
            	text: 'cancel',
                click: function() {
            		$(this).addClass('cancel');
            	    $('#removeDialog').dialog('close');
            	}
            }, {
                text: 'remove',
                click: function() {
                    var urlm5 = $('#removeDialog #urlm5').val();
                    var url = $('#item-' + urlm5 + ' .taggedlink').attr('href');
                    var sender = $('#item-' + urlm5 + ' .user-tag span').attr('title');
                    $.ajax({
                        url: '/remove',
                        data: {
                            sender: sender,
                            url: url
                        },
                        success: function(result){
                            if(result == 'True'){
                                window.location.reload();
                            }
                            else{
                                alert('Uh oh, something happened!');
                            }
                        },
                        error: function(xhr){
                            del.displayError(xhr.responseText);
                        }
                    });
                }
            }]
        });
        $('.generalInput, .searchInput').focus(function(){
            del.focusInputBox($(this));
        });
        $('.searchIcon').click(function(event){
            event.preventDefault();
            var searchQuery = $('#global-searchinput').val();
            if(searchQuery != 'search'){
                $('#global-searchform').submit();
            }
            else{
                $('#global-searchinput').focus();
            }
        });
        $('#global-searchinput').focus(function(){
            del.focusInputBox($(this));
        });
        $('#global-searchinput').blur(function(){
            del.blurInputBox($(this), 'search');
        });
        $('#tagOptsLnk').click(function(){
            $('#tagOptsList').toggle();
        });
        $('.post input:checkbox').change(function(){
            var bookmark = $(this).closest('.post');
            if($(this).is(':checked')){
                del.selectBookmark(bookmark);
            }
            else{
                del.deselectBookmark(bookmark);
            }
        });
        $('.selectChoice input').change(function(){
            if($(this).is(':checked')){
                del.checkAllBookmarks();
            }
            else{
                del.uncheckAllBookmarks();
            }
        });
        $('#bulkEditActions a').click(function(){
            var action = $.trim( $(this).text() );
            if(action == 'create stack'){
                $('#globalCreateStackBtn').click();
            }
            else{
                var checkedLinks = $('#bookmarklist input:checked');
                var linkList = [];
                $.each(checkedLinks, function(){
                    var bookmark = $(this).closest('.post');
                    var bookmarkId = bookmark.attr('id');
                    var hyphenIndex = bookmarkId.indexOf('-');
                    var urlm5 = bookmarkId.substring(hyphenIndex + 1);
                    if(urlm5){
                        linkList.push(urlm5);
                    }
                });
                if(linkList.length == 0 && action != 'manage tags' && action != 'rename tag'){
                    del.okDialog('check some links first.');
                    return false;
                }
                if(action == 'make public' || action == 'make private'){
                    var makePublic = true;
                    if(action == 'make private'){
                        makePublic = false;
                    }
                    var publicOrPrivate = makePublic ? 'public' : 'private';
                    var question = 'make these links ' + publicOrPrivate + '?';
                    del.confirmDialog(question, null, 'yes', function(){
                        del.convertBookmarkPrivacy(linkList.toString(), makePublic);
                    });
                }
                else if(action == 'delete'){
                    del.confirmDialog('delete these links?', null, 'yes', function(){
                        del.deleteBookmarks(linkList.toString());
                    });
                }
                else if(action == 'manage tags'){
                    $('li#manageTagsContainer').fadeToggle();
                    $('.manageTags').toggleClass('selected');
                }
                else if(action == 'add tag'){
                    // open dialog to add tags
                    $('#addBookmarkTagsDialog').dialog({
                        autoOpen: false,
                        resizable: false,
                        width: 465,
                        zIndex: 5000,
                        modal: true,
                        buttons : [{
                            text: 'cancel',
                            click: function(){
                                $(this).dialog('close');
                            }
                        }, 
                        {
                        text: 'add',
                        click: function(){
                            var tags = $('#saveTags').val();
                                if(tags.length > 0){
                                    $.post('/posts/tags/add', {
                                            md5s: linkList.toString(),
                                            tags: tags
                                        },
                                        function(){
                                            del.okDialog('tags added successfully.');
                                            window.location.reload();
                                        }, 'json');
                                    $(this).dialog('close');
                                }
                                else{
                                    del.okDialog('you must enter a tag.');
                                }
                            }
                        }],
                        open: function(){
                            $('#addBody').html(del.LOADING_IMAGE).load('/posts/tags/load');
                        },
                        close: function(){
                            $('#addBody').html('');
                        }
                    });
                    $('#addBookmarkTagsDialog').dialog('open');
                    $('#addBookmarkTagsDialog').parent().find('button:contains("cancel")').addClass('cancel');
                }
                else if(action == 'remove tag'){
                    // collect md5s, do ajax to get the duplicate tags
                    $.ajax({
                        url: '/posts/tags/dupes',
                        type: 'POST',
                        data: { md5s: linkList.toString() },
                        success: function(data){
                            if(data.duplicate_tags.length < 1){
                                del.okDialog(del.NO_COMMON_TAGS);
                                $('#removeBookmarkTagsDialog').dialog('close');
                            }
                            else{
                                del.openRemoveBookmarkDialog(linkList, data);
                            }
                        }
                    });
                }
                else if(action == 'rename tag'){
                    // open dialog to add tags
                   del.openRenameTagsDialog();
                }
                else if(action == 'add to stack'){
                    $('#addToStackDialog').dialog({
                        autoOpen: false,
                        resizable: false,
                        width: 290,
                        zIndex: 5000,
                        modal: true,
                        title: 'add links to stack',
                        buttons : [
                            {
                                text: 'cancel',
                                click: function(){
                                    $(this).dialog('close');
                                }
                            },
                            {
                                text: 'ok',
                                click: function(){
                                var stackId = $('#stackDropDown').val();
                                var stackName = $('#stackDropDown option[value=' + stackId + ']').text();
                                var urlm5s = $('#urlm5s').val();
                                $.post('/stacks/add/' + stackId, { md5s: urlm5s},
                                    function(){
                                        del.okDialog('Links added to stack: ' + stackName);
                                        del.uncheckAllBookmarks();
                                    }, 'json');
                                $(this).dialog('close');
                            }
                        }],
                        open: function(){
                            $(this).html(del.LOADING_IMAGE);
                            $(this).load('/stacks/recent/' + del.getLoggedInUsername() + '?urlm5s=' + linkList);
                        },
                        close: function(){
                            $('#stackDropDown').val('');
                            $('#urlm5s').val('');
                        }
                    });
                    $('#addToStackDialog').dialog('open');
                }
            }
            return false;
        });
        $('.toPublic').click(function(){
            var bookmark = $(this).closest('.post');
            var bookmarkId = bookmark.attr('id');
            var hyphenIndex = bookmarkId.indexOf('-');
            var urlm5 = bookmarkId.substring(hyphenIndex + 1);
            del.convertBookmarkPrivacy(urlm5, true);
            return false;
        });
        $('.shareLink').live('click',function(){
            var $this = $(this);
            var url = $this.attr('href');
            var stack_id = $this.attr('stackid');
            var title = $this.attr('title');
            if(title == undefined || $.trim(title).length == 0) {
                title = "share";
            } else if(title.length > del.SHARE_TITLE_TRUNCATION_LENGTH) {
                title = title.substring(0, del.SHARE_TITLE_TRUNCATION_LENGTH) + '...';
            }
            var $shareDialog = $('#shareDialog');
            if(url != undefined) {
                $shareDialog.data('url', url);
            }
            if(stack_id != undefined) {
                $shareDialog.data('stack_id', stack_id);
            }
            $shareDialog.dialog('option', 'title', title);
            $shareDialog.dialog('open');
            return false;
        });
        $('#bannerShare').click(function() {
            var urlmd5 = $(this).attr('urlmd5');
            $('#shareDialog #urlm5').val(urlmd5);
            $('#shareDialog').dialog('open');
            return false;
        });
        $('#profilePicPreview').click(function(){
            $('#file').click();
        });
        $('.deleteStack').click(function(event) {
            event.preventDefault();
            var deleteUrl = $(this).attr('href');
            //var stackName = $('#stackTitleText').text();
            var question = 'Are you sure you want to delete this stack?';
            del.confirmDialog(question, deleteUrl, 'delete', function(data){
                if(data.error){
                    del.displayError(data.error);
                }
                else{
                    window.location.href = '/stacks/' + del.getLoggedInUsername();
                }
            });
        });
        $('.videoThumbnail').click(function(event){
            var videoWidth = $(this).attr('vwidth');
            var videoHeight = $(this).attr('vheight');
            event.preventDefault();
            $('.videoDialog').dialog({
                autoOpen: false,
                resizable: true,
                width: parseFloat(videoWidth) + 80,
                height: parseFloat(videoHeight) + 80,
                zIndex: 5000,
                modal: true
             });
            $('.videoDialog').html('<iframe width="' + videoWidth + '" height="' + videoHeight + '" src="' + $(this).attr('href') + '" frameborder="0" allowfullscreen></iframe>');
            $('.videoDialog').dialog('open');
        });
        $('#username-field').keyup(function(){
            var usernameValid = $('#usernameValid');
            var username = $.trim(this.value);
            if(username != this.lastValue){
                if(this.timer){
                    window.clearTimeout(this.timer);
                }
                usernameValid.show().html(del.LOADING_IMAGE + ' checking...');

                if(!username){
                    usernameValid.html(del.ERROR_IMAGE + ' Please enter a username.');
                    return;
                }
                if(username.length > 64){
                    usernameValid.html(del.ERROR_IMAGE + ' Maximum length for username is 64.');
                    return;
                }
                var illegalChars = /\W/;
                // allow only letters, numbers, and underscores
                if (illegalChars.test(username)) {
                   usernameValid.html(del.ERROR_IMAGE + ' Only letters, numbers, and underscores allowed.');
                    return;
                }
                this.timer = window.setTimeout(function(){
                    $.ajax({
                        url: '/user_exists',
                        data: { username: username },
                        type: 'POST',
                        success: function(data){
                            if(data.error){
                                usernameValid.html(del.ERROR_IMAGE + data.error_msg);
                            }
                            else{
                                usernameValid.html(del.VALID_IMAGE);
                            }
                        },
                        error: function(xhr){
                            del.displayError(xhr.responseText);
                        }
                    });
                }, 800);

                // copy the latest value to avoid sending requests when we don't need to
                this.lastValue = username;
            }
        });
        $('#email').keyup(function(){
            var emailValid = $('#emailValid');
            var email = $.trim(this.value);
            if(email && email != this.lastValue){
                if(this.timer){
                    window.clearTimeout(this.timer);
                }
                emailValid.show().html(del.LOADING_IMAGE + ' checking...');

                if(!email){
                    emailValid.html(del.ERROR_IMAGE + ' Please enter an email address.');
                    return;
                }

                if(email.length < 6){
                    emailValid.html(del.ERROR_IMAGE + ' The email you entered is invalid.');
                    return;
                }

                this.timer = window.setTimeout(function(){
                    if(!email.match(/^[a-zA-Z0-9\._\-\+]+@[a-zA-Z0-9\._\-]+\.[a-zA-Z]{2,4}$/)) {
                        emailValid.html(del.ERROR_IMAGE + ' The email you entered is invalid.');
                        return;
                    }

                    $.ajax({
                        url: '/email_exists',
                        data: { email: email },
                        type: 'POST',
                        success: function(data){
                            if(data.error){
                                emailValid.html(del.ERROR_IMAGE + data.error_msg);
                            }
                            else{
                                emailValid.html(del.VALID_IMAGE);
                            }
                        },
                        error: function(xhr){
                            del.displayError(xhr.responseText);
                        }
                    });
                }, 800);

                // copy the latest value to avoid sending requests when we don't need to
                this.lastValue = this.value;
            }
        });
        $('#password1').keyup(function(){
            var passwordValid = $('#passwordValid');
            var pw = $.trim(this.value);
            if(pw && pw != this.lastValue){
                if(this.timer){
                    window.clearTimeout(this.timer);
                }
                passwordValid.show().html(del.LOADING_IMAGE + ' checking...');

                this.timer = window.setTimeout(function(){
                    /* In case we want to go back to password mistake-specific code...
                    if(pw.length < 6){
                        passwordValid.html(del.ERROR_IMAGE + ' Password should be greater than 6 characters.');
                    }
                    else if(!pw.match(/[a-zA-Z]+/)){
                        passwordValid.html(del.ERROR_IMAGE + ' Password should contain at least 1 letter.');
                    }
                    else if(!pw.match(/\d+/)){
                        passwordValid.html(del.ERROR_IMAGE + ' Password should contain at least 1 number.');
                    }
                    else if(!pw.match(/([!,@,#,$,%,^,&,*,?,_,~])/)){
                        passwordValid.html(del.ERROR_IMAGE + ' Password should contain at least 1 symbol.');
                    }*/
                    if(!del.validatePassword(pw)){
                        passwordValid.html(del.ERROR_IMAGE + ' Password should be greater than 6 characters and ' +
                                                                'include at least one letter and one number or symbol');
                    }
                    else{
                        passwordValid.html(del.VALID_IMAGE);
                    }
                }, 800);

                // copy the latest value to avoid sending requests when we don't need to
                this.lastValue = this.value;
            }
        });
        $('#password2').keyup(function(){
            var passwordMatchValid = $('#passwordMatchValid');
            var pwMatch = $.trim(this.value);
            var pwFirstField = $('#password1').val();
            if(pwMatch && pwMatch != this.lastValue){
                if(this.timer){
                    window.clearTimeout(this.timer);
                }
                passwordMatchValid.show().html(del.LOADING_IMAGE + ' checking...');

                this.timer = window.setTimeout(function () {
                    if(pwMatch == pwFirstField){
                        passwordMatchValid.html(del.VALID_IMAGE);
                    }
                    else{
                        passwordMatchValid.html(del.ERROR_IMAGE + ' Passwords do not match.');
                    }
                }, 800);

                // copy the latest value to avoid sending requests when we don't need to
                this.lastValue = this.value;
            }
        });
        $('#newTagsInput').live('keydown', function(e){
            var tag = $.trim($(this).val());
            if(e.which == 188 || e.which == 13){ // comma key or enter key
                if(!tag){ // prevents entering just commas for the tags
                    e.preventDefault();
                }
                else if(tag.length && tag.match(/[\S]+/)){
                    e.preventDefault();
                    del.addNewTag(tag, $(this));
                }
            }
            else if (e.which == 8){ // backspace key
                if(!tag.length){
                    $('.newTagInputWrapper').prev().remove();
                    var oldTags = $('#saveTags').val();
                    var lastCommaIndex = oldTags.lastIndexOf(',');
                    if(lastCommaIndex > 0){
                        $('#saveTags').val(oldTags.substring(0, lastCommaIndex));
                    }
                    else{ // Only one tag was entered, so just clear the field.
                        $('#saveTags').val('');
                    }
                }
            }
        });
        // Applies the tag bubble to last tag if it wasn't done already.
        $('#newTagsInput').live('blur', function(){
            del.addNewTagWrapper($(this));
        });
        $('.newTagsEditor').live('click', function(){
            $('#newTagsInput').focus();
        });
        $('.newTagItem .rm').live('click', function(){
            var tag = $(this).closest('.newTagItem').find('.tagName').attr('title');
            $(this).closest('.newTagItem').remove();
            var tags = $('#saveTags').val().split(',');
            tags.splice(tags.indexOf(tag), 1);
            $('#saveTags').val(tags.join(','));
        });
        $('#login-form').keypress(function(e){
            if(e.which == 13){
                e.preventDefault();
                del.submitLogin();
                return false;
            }
        });
        $('#networkPrivacyForm input:checkbox, #email_url input:checkbox').change(function(){
            $('#ajaxLoading').show();
            $.ajax({
                url: '/settings/update_user_flag',
                type: 'POST',
                data: {
                    username: $('#profile_name').val(),
                    pref_name: $(this).attr('id'),
                    pref_value: $(this).is(':checked')
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                },
                complete: function(){
                    $('#ajaxLoading').hide();
                }
            });
        });
        $('.stackDescription #stackIntro, #editStackDescription').focus(function() {
            if($(this).val() == del.STACK_DESCRIPTION_PLACEHOLDER){
                del.focusInputBox($(this));
            }
        });
        $('#usernameEmail').focus(function(){
            if($(this).val() == del.FORGOT_PASSWORD_PLACEHOLDER){
                del.focusInputBox($(this));
            }
        });
        $('#addsublink, #addsubbutton').click(function() {
            $('#options-mod-addSubscriptions').toggle();
            return false;
        });
        $('#options-close-addSubscriptions, #subscription-cancel').click(function() {
            $('#options-mod-addSubscriptions').hide();
            return false;
        });
        $('#addSubscriptionForm').submit(function() {
            var tagStr = $('#subtag').val();
            if(!tagStr || $.trim(tagStr).length == 0) {
                del.okDialog('please enter a tag');
            } else {
                del.addSubscription(tagStr, $('#addConfBttns'));
            }
            return false;
        });
        $('#removesub .delete').click(function() {
            var $this = $(this);
            var tag = $this.attr('tag');
            del.removeSubscription(tag, $this, $this.parents('li:first'));
            return false;
        });
        $('.bookmark-actions .delete, .sidebarStats .delete').live('click', function() {
            var $caller = $(this);
            var $confirm = $('#confirmationDialog');
            var url = $caller.attr('url');
            $confirm.attr('title', 'delete link');
            $confirm.html('<h3>Are you sure you want to delete this link?</h3>');
            $confirm.dialog({
                resizable: false,
                buttons : [{
                    text: 'cancel',
                    click: function(){
                        $confirm.dialog('close');
                    }
                }, {
                    text: 'delete',
                    click: function(){
                        del.deleteBookmark(url, $caller);
                        $confirm.dialog('close');
                    }
                }]
            });
            $confirm.dialog('open');
            $confirm.parent().find('button:contains("cancel")').addClass('cancel');
            return false;
        });
        $('#saveSearch').click(function() {
            var $this = $(this);
            var bundle = $this.attr('bundle');
            $.ajax({
                url: '/search/ws/save_search',
                type: 'POST',
                data: {
                    'bundle': bundle
                },
                success: function(data) {
                    var savedSearchDiv = $(data).find('#savedSearch-' + bundle);
                    var result = savedSearchDiv.attr('result');
                    if(result == 'N') {
                        $('#savedSearchList').prepend(savedSearchDiv.html());
                        $('#savedSearchMainDiv').css({'display' : ''});
                        $('#savedSearchButton').html('saved');
                        $this.attr('id', 'saveSearch-saved');
                    }
                    else if(result == 'E') {
                        alert('Previously saved search');
                    }
                    else{
                        alert(savedSearchDiv.attr('error'));
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                }
            });
            return false;
        });
        $('#adminFeatureStack').click(function() {
            var $this = $(this);
            var stackId = $('#featuredSection').attr('stack_id');
            del.featureStack(stackId, $this);
            return false;
        });
        $('#adminRefetchStack').click(function() {
            var $this = $(this);
            var stackId = $('#featuredSection').attr('stack_id');
            del.refetchStack(stackId, $this);
            return false;
        });
        $('#adminUnfeatureStack').click(function() {
            var $this = $(this);
            var stackId = $('#featuredSection').attr('stack_id');
            del.unfeatureStack(stackId, $this);
            return false;
        });
        $('#adminFeatureLink').click(function() {
            var $this = $(this);
            var md5 = $('#featuredLinkSection').attr('url_md5');
            del.featureLink(md5, $this);
            return false;
        });
        $('#adminUnfeatureLink').click(function() {
            var $this = $(this);
            var md5 = $('#featuredLinkSection').attr('url_md5');
            del.unfeatureLink(md5, $this);
            return false;
        });
        $('#adminFeaturedLinksRotate').click(function() {
            del.rotateFeaturedLinks();
            return false;
        });
        $('#adminFeaturedStacksRotate').click(function() {
            del.rotateFeaturedStacks();
            return false;
        });
        $('#adminFeaturedLinksRefresh').click(function() {
            del.refreshFeaturedLinks();
            return false;
        });
        $('#adminFeaturedStacksRefresh').click(function() {
            del.refreshFeaturedStacks();
            return false;
        });
        $('.adminFeaturedLinkDelete').click(function() {
            var $this = $(this);
            var md5 = $(this).parent().attr('url_md5');
            del.unfeatureLink(md5, $this);
            return false;
        });
        $('.adminFeaturedStackDelete').click(function() {
            var $this = $(this);
            var stack_id = $(this).parent().attr('stack_id');
            del.unfeatureStack(stack_id, $this);
            return false;
        });
        $('#adminFeatureThumb').click(function() {
            var stack_id = $('#featuredSection').attr('stack_id');
            $('#featuredThumbnailList').load('/admin/stack/feature_thumb/choose/' + stack_id);
            $('#featuredThumbnailList').toggle();
            return false;
        });

        // START STACKS WIDGET CODE
        /*$('#stackSlider').click(function() {
            $('#stacksWidget').toggle();
            return false;
        });
        $('#widgetCreateStackButton').button({
            text: false,
            icons: { primary: 'ui-icon-plusthick' }
        }).click(function() {
            $('#widgetCreateStackForm').show();
            $(this).hide();
            $('#widgetCreateStackName').focus();
            return false;
        });
        $('#widgetCreateStackForm').live('mouseout', function(event) {
            $('#widgetCreateStackButton').show();
            $('#widgetCreateStackForm').hide();
            return false;
        });
        $('#widgetCreateStackForm').submit(function() {
            var stackname = $.trim($('#widgetCreateStackName').val());
            if(stackname.length > 0 ) {
                del.createStackApi(stackname, $('#createStackElement'));
            }
            return false;
        });
        $('#gallery li.stack').live('dragover', function(event) {
            $(this).addClass('dragover');
            return false;
        });
        $('#gallery li.stack').live('dragleave', function(event) {
            $(this).removeClass('dragover');
            event.preventDefault();
        });
        var elements = document.querySelectorAll('#bookmarklist .draggableData');
        [].forEach.call(elements, function(el) {
            el.addEventListener('dragstart', function(e) {
                //this.style.opacity = '0.4';
                e.dataTransfer.effectAllowed = 'move';
                var url = $(this).find('.taggedlink').attr('href');
                e.dataTransfer.setData('Text', url);
            },
            false);
        });
        var droppables = document.querySelectorAll('#gallery li.stack');
        [].forEach.call(droppables, function(dropable) {
            dropable.addEventListener('drop', function(e) {
                if(e.stopPropagation()) {
                    e.stopPropagation();
                }
                e.preventDefault();
                var url = e.dataTransfer.getData('Text');
                var stack_id = $(this).attr("stackid");
                del.addLinkToStack(stack_id, url, url, $(this));
                $(this).removeClass('dragover');
                return false;
            },
            false)
        });*/
        // END STACK WIDGET CODE

        // manage tags
        $('#deleteTags').submit(function() {
            var oldTag = $('#oldTagSelector').val();
            if(oldTag == 'av_pickatag') {
                alert('Please pick a tag');
                return false;
            }
            del.deleteTag(oldTag, $('#deleteTagsButton'));
            return false;
        });
        $('#followStackBtn, #actionRemoveFromMyNetwork').mouseover(function() {
            var $button = $(this);
            if($button.hasClass('following')) {
                $button.children('a:first').html('unfollow').removeClass('green').addClass('red');
            }
        });
        $('#followStackBtn, #actionRemoveFromMyNetwork').mouseout(function() {
            var $button = $(this);
            if($button.hasClass('following')) {
                $button.children('a:first').html('<span class="check"></span>following').removeClass('red').addClass('green');
            }
        });
        $('#followStackBtn').click(function() {
            var $button = $(this);
            var stack_id = $button.attr('stackid');
            var username = $button.attr('editor');
            if($button.hasClass('following')) {
                del.unfollowStack(username, stack_id, $button, function() {
                    $button.removeClass('following').addClass('notfollowing');
                    $('#followStackBtn a').html('follow stack').removeClass('red').addClass('green');
                });
            } else {
                del.followStack(username, stack_id, $button, function() {
                    $button.removeClass('notfollowing').addClass('following');
                    $('#followStackBtn a').html('<span class="check"></span>following').removeClass('red').addClass('green');
                });
            }
            return false;
        });
        $('.followStackListBtn').live('click', function() {
            var $button = $(this);
            var stack_id = $(this).attr('stack_id');
            var username = $(this).attr('author');
            if($button.hasClass('following')) {
                del.unfollowStack(username, stack_id, $button, function() {
                    $button.removeClass('following').addClass('unfollowing');
                    $('#follow-' + stack_id).html('follow');
                });
            } else {
                del.followStack(username, stack_id, $button, function() {
                    $button.removeClass('unfollowing').addClass('following');
                    $('#follow-' + stack_id).html('unfollow');
                });
            }
            return false;
        });
        $('#replyStackBtn').live('click',function(){
            $('#responseStackDialog').dialog('open');
            return false;
        });

        $('.post').live('mouseover', function(){
            var $this = $(this);
            var linkHeight = $this.height();
            $this.addClass('selected');
            //$this.find('.linkDetailsAnchor').css('height', linkHeight);
            $this.find('.stackStatsContainer').hide();
            $this.find('.bookmark-actions').show();
            $this.find('.myNotes textarea').css('border', '1px solid #ccc');
            return false;
        });
        $('.post').live('mouseout', function(){
            var $this = $(this);
            $this.removeClass('selected');
            $this.find('.stackStatsContainer').show();
            $this.find('.bookmark-actions').hide();
            $this.find('.myNotes textarea').css('border', '0');
            return false;
        });
        $('.bookmark-actions .edit, .bookmark-actions .save, .actions_grid .save').live('click', function(){
            var fullUrl = $(this).attr('href');
            del.saveConfirmDialog(fullUrl, null);
            return false;
        });
        $('#jcropTarget').Jcrop({ boxWidth: 410, boxHeight: 305, onChange: del.updateJcropCoordinates, aspectRatio: 1, setSelect: [0,0,215,215]});
        $('#delete_profile_pic_link').click(function(){
            del.confirmDialog('Are you sure you want to delete your profile pic?',
                '/settings/delete_profile_pic', 'delete', function(data) {
                    if(data.error) {
                        alert(data.error_msg);
                    } else {
                        window.location.href = '/settings';
                    }
                });
            return false;
        });
        $('.exportComplete').click(function(){
            $(this).html(del.EXPORT_DIV).fadeIn();
            return false;
        });
        $('.formSubmitButton').click(function(){
            $('#delLoading').show();
            $(this).closest('form').submit();
            $('#delLoading').hide();
            return false;
        });
        $('#deleteAccount').click(function(){
            del.confirmDialog(del.DELETE_USER_PROMPT, '/settings/profile/delete', 'delete',
                function(data) {
                    if(data.error) {
                        alert(data.error_msg);
                    } else {
                        window.location.href = '/logout';
                    }
                });
            return false;
        });
        $("#admin-featured-links-list").sortable({
          handle: ".item-mover",
          update: function(event, ui){
            var curr_id = ui.item.attr("id").split("-").pop();
            var prv_item = ui.item.prev();
            if(prv_item && prv_item.attr("id")) {
                var prv_id = prv_item.attr("id").split("-").pop();
                del.reorderFeaturedLink(curr_id, prv_id);
            } else {
                del.reorderFeaturedLink(curr_id, null);
            }
          }
        });
        $("#admin-featured-links-list").disableSelection();
        $("#admin-featured-stacks-list").sortable({
          handle: ".item-mover",
          update: function(event, ui){
            var curr_id = ui.item.attr("id").split("-").pop();
            var prv_item = ui.item.prev();
            if(prv_item && prv_item.attr("id")) {
                var prv_id = prv_item.attr("id").split("-").pop();
                del.reorderFeaturedStack(curr_id, prv_id);
            } else {
                del.reorderFeaturedStack(curr_id, null);
            }
          }
        });
        $("#admin-featured-stacks-list").disableSelection();
        $('#shareRecentRecipients').change( function() {
            $('#shareReceiver').val($(this).val());
        });
        $('#settingsSave').click(function(){
            $('#delLoading').show();
            $.ajax({
                url: '/settings_submit',
                type: 'POST',
                data: {
                    'profile_email' : $('#profile_email').val(),
                    'profile_url' : $('#profile_url').val()
                },
                success: function(data){
                    if(data.error){
                        alert(data.error_msg);
                    }
                    else{
                        del.okDialog('settings saved!');
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                },
                complete: function(){
                    $('#delLoading').hide();
                }
            });
            return false;
        });
        $('.followUserBtn').live('click', function() {
            var $this = $(this);
            var username = $this.parents('.userBrick').attr('username');
            del.followUser(username, $this, function() {
                $this.removeClass('green').removeClass('followUserBtn').addClass('white').addClass('unfollowUserBtn').text('unfollow');
            });
            return false;
        });
        $('.unfollowUserBtn').live('click', function() {
            var $this = $(this);
            var username = $this.parents('.userBrick').attr('username');
            del.unfollowUser(username, $this, function() {
                $this.removeClass('white').removeClass('unfollowUserBtn').addClass('green').addClass('followUserBtn').text('follow');
            });
            return false;
        });
        $('#toggleBundleTags').click(function(){
            $('#bundleTags').slideToggle();
            if($(this).html() == 'show all tags in bundle'){
                $(this).html('hide all tags in bundle');
            }
            else{
                $(this).html('show all tags in bundle');
            }
            return false;
        });
        $('#bundleForm .save').click(function(){
            var bundleName = $('#bundleNameInput').val();
            var tags = $('#saveTags').val();

            if(!bundleName || !tags){
                del.okDialog('you must enter a bundle name and tags.')
            }
            else{
                $.post('/settings/tags/bundle/edit',
                    {
                        'bundle' : $('#bundleNameInput').val(),
                        'oldBundle': $('#oldBundle').val(),
                        'tagsInput': $('#saveTags').val()
                    },
                    function(data){
                        if(data.error_msg){
                            del.okDialog(data.error_msg);
                        }
                        else{
                            window.location.href = '/settings/tags/bundle';
                        }
                    }
                );
            }
            return false;
        });
        del.initHomePage();
        del.initBanner();
        del.initSavePage();
    },
    getCheckedLinks: function() {
        var checkedLinks = $('#bookmarklist input:checked');
        var linkList = [];
        $.each(checkedLinks, function(){
            var bookmark = $(this).closest('.post');
            var bookmarkId = bookmark.attr('id');
            var hyphenIndex = bookmarkId.indexOf('-');
            var urlmd5 = bookmarkId.substring(hyphenIndex + 1);
            if(urlmd5){
                linkList.push(urlmd5);
            }
        });
        return linkList;
    },
    initTinyMCE: function(onChangeCallback) {
        $('textarea.tinymce').tinymce({
            // Location of TinyMCE script
            script_url : '/static/js/tiny_mce/tiny_mce.js',

            // General options
            theme : "advanced",
            mode: "exact",
            height: "100",
            width: "560",

            // Theme options
            theme_advanced_buttons1 : "bold,italic,underline,separator,undo,redo,separator,bullist,numlist",
            theme_advanced_buttons2 : "",
            theme_advanced_buttons3 : "",
            theme_advanced_toolbar_location : "top",
            theme_advanced_toolbar_align : "left",
            theme_advanced_statusbar_location : "",
            theme_advanced_resizing : true,

            onchange_callback : onChangeCallback,
            // Example content CSS (should be your site CSS)
            content_css : "/static/css/del-new.css",

            setup: function(ed) {
                // Display an alert onclick
                ed.onClick.add(function(ed) {
                    if(ed.getContent().indexOf(del.STACK_DESCRIPTION_PLACEHOLDER) > -1 ||
                            ed.getContent().indexOf(del.ADD_SLICE_PLACEHOLDER) > -1){
                        ed.setContent('');
                    }
                });
            }
        });
    },
    followStack: function(username, stackId, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/stack/' + stackId + '/follow/' + username,
            type: 'POST',
            dataType: 'json',
            data: { 'csrf_token': $loadingElement.attr('csrf_token') },
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if(successFunc) {
                        successFunc.call();
                    }
                }
            },
            error: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                alert('unknown error');
            }
        });
    },
    unfollowStack: function(username, stackId, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/stack/' + stackId + '/unfollow/' + username,
            type: 'POST',
            dataType: 'json',
            data: { 'csrf_token': $loadingElement.attr('csrf_token') },
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if(successFunc) {
                        successFunc.call();
                    }
                }
            },
            error: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                alert('unknown error');
            }
        });
    },
    followUser: function(username, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/network/' + username + '/follow',
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if(successFunc) {
                        successFunc.call();
                    }
                }
            },
            error: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                alert('unknown error');
            }
        });
    },
    unfollowUser: function(username, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/network/' + username + '/unfollow',
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if(successFunc) {
                        successFunc.call();
                    }
                }
            },
            error: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                alert('unknown error');
            }
        });
    },
    initMyHome: function(username) {
        $('#tabSection .tabs a').live('click', function(){
            var $this = $(this);
            var this_id = $this.attr('id');
            if(!$this.parents('ul').hasClass('subtabs')) {
                $this.parents('.tabs').find('li.active:first').removeClass('active');
                $this.parent('li').addClass('active');
                $('#tabSection .subtabs').hide();
                var $subTabs = $('#' + $this.attr('id') + 'Sub');
                if($subTabs.length > 0) {
                    $subTabs.show();
                    $subTabs.find('li a:first').click();
                    return false;
                }
            }
            $this.parents('.tabs').find('li.active:first').removeClass('active');
            $this.parent('li').addClass('active');
            var href = $this.attr("href");
            var sidebarUrl = $this.attr("sidebarurl");
            if(sidebarUrl) {
                var $feedFilter = $('#feedFilter');
                $feedFilter.html(del.LOADING_DIV).show();
                window.setTimeout(function() {$feedFilter.load(sidebarUrl);}, 300);
            } else {
                $('#feedFilter').html('').hide();
            }
            $('#feedContent').html(del.LOADING_DIV).load(href);
            return false;
        });

        $('#tabSection .tabs a:first').click();

        $('#feedItemsLoadMore').live('click', function() {
            var $this = $(this);
            var next_url = $this.attr("href");
            var loadMore = $this.parent('.loadMore');
            loadMore.html(del.LOADING_DIV);
            $.get(next_url, null, function(data) {
                var $data = $(data);
                $('#feed_table').append($data.find('tr'));
                loadMore.html($data.find("#feedItemsLoadMore"));
            });
            return false;
        });
        $('#feedFiltersLoadMore').live('click', function() {
            var $this = $(this);
            var next_url = $this.children('a').attr('href');
            $this.html(del.LOADING_DIV);
            $.get(next_url, null, function(data) {
                var $data = $(data);
                $('#filterList').append($data.find('#filterList'));
                $this.html($data.find("#feedFiltersLoadMore"));
            });
            return false;
        });
        $('#contentDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 600,
            height: 420,
            modal: true,
            show: "drop",
            hide: "drop",
            zIndex: 5000
        });
        $('#followTagDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 300,
            height: 200,
            modal: true,
            show: "drop",
            hide: "drop",
            zIndex: 5000,
            buttons: [{
                text: 'follow',
                click: function() {
                    var tag = $('#followTagInput').val();
                    if(tag == null || tag == undefined || $.trim(tag).length == 0) {
                        alert('please enter a tag');
                    } else {
                        del.addSubscription(tag, null, function() {
                            $('#followTagDialog').dialog('close');
                            $('#followingTagsTab').click();
                        });
                    }
                }
            }, {
                text: 'cancel',
                click: function() {
                    $('#followTagDialog').dialog('close');
                }
            }],
            open: function() {
                $('#followTagInput').val('').focus();
            }
         });
        $('#followTagButton').live('click', function() {
            $('#followTagDialog').dialog('open');
            return false;
        });
        $('.shareButton').live('click', function(event) {
            var url = $(this).attr('href');
            $('#shareDialog').data('url', url);
            $('#shareDialog').dialog('open');
            event.preventDefault();
        });
        $('#filterList .filterItem').live('click', function() {
            var $this = $(this);
            $this.siblings('.active:first').removeClass('active');
            var href = $this.children('a:first').attr('href');
            $this.addClass('active');
            $('#feedContent').html(del.LOADING_DIV).load(href);
            return false;
        });
        $('#tagFilterSearchBox').live('focus', function() {
            $(this).val('');
        })
        .live('blur', function() {
            $(this).val('search');
        });
        $('#tagFilterSearch').live('submit', function() {
            alert("i be submit");
            return false;
        });
    },
    loadMoreTable: function(url, $loadMore, table_id) {
        var loadMore = $loadMore;
        loadMore.html(del.LOADING_DIV);
        $.get(url, null, function(data) {
            var $data = $(data);
            $(table_id).append($data.find('tr'));
            loadMore.html($data.find(loadMore.attr('id')));
        });
    },
    initHelp: function(tab) {
        $('.tabs li a').live('click', function(){
            var $this = $(this);
            $this.parent().siblings().removeClass('active');
            $this.parent().addClass('active');
            var href = $(this).attr("href");
            $('#helpContent').html(del.LOADING_DIV).load(href);
            return false;
        });
        $('.' + tab + ' a').click();
        $('.faqLink').live('click', function(){
            var $this = $(this);
            var href = $this.attr("href");
            $this.parents().find('.tabs li').removeClass('active');
            $this.parents().find('.faqTab').addClass('active');
            $('#helpContent').html(del.LOADING_DIV).load(href);
            return false;
        });
        var url = document.location.toString();
        if(url.match(/#/)){ // Need to delay for a bit so everything loads.
            window.setTimeout(function() {
                var anchor = '#' + url.split('#')[1];
                $('a[href="' + anchor + '"]').click();
            }, 1000);
        }
    },
    initSearch: function() {
        $('.tabs li a').click(function(){
            var $this = $(this);
            $this.parent().siblings().removeClass('active');
            $this.parent().addClass('active');
            //return false; //commenting out until search results are AJAXified
        });
    },
    initUserProfile: function() {
        $('.linkList li').each(function() {
        var $this = $(this);
        var liHeight = $this.height();
        $this.find('.bulkSelect').css({'height': liHeight-6});
        });
        $('.subHeadline #editTags').click(function(){
            del.openRenameTagsDialog();
            return false;
        });
    },
    loadSearchPartial: function(mainContent, keyword, filter, al, last) {
        $.ajax({
            url: '/search/ws/everything',
            type: 'POST',
            data: {
                'p': keyword,
                'filter': filter,
                'al': al,
                'f': last
            },
            success: function(data) {
                var resultsDiv = $(data).find('#everythingSearchResults');
                var relTagsInner = $(data).find('#searchFragmentRelatedTags');
                var result = resultsDiv.attr('result');
                if(result == 'S') {
                    mainContent.html(resultsDiv);
                    $('#searchRelatedTags').html(relTagsInner.html());
                }
                //else{
                //    alert(resultsDiv.attr('error'));
                //}
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }
        });
        return false;
    },
    loadSearchResults: function(keyword, al) {
        var mainContent = $('#searchMainContent');
        $.ajax({
            url: '/search/ws/everything',
            type: 'POST',
            data: {
                'p': keyword,
                'al': al
            },
            success: function(data) {
                var resultsDivOuter = $(data).find('#everythingSearchResults');
                var result = resultsDivOuter.attr('result');
                var relTagsOuter = $(data).find('#searchFragmentRelatedTags');
                if(result == 'S') {
                    mainContent.html(resultsDivOuter);
                    //$('#searchRelatedTags').html(relTagsOuter.html());
                }
                //else{
                //    alert(resultsDivOuter.attr('error'));
                //}
                $.ajax({
                    url: '/search/ws/everything',
                    type: 'POST',
                    data: {
                        'p': keyword,
                        'al': 'ABP',
                        'f': 1
                    },
                    success: function(data) {
                        var resultsDivInner = $(data).find('#everythingSearchResults');
                        var existingData = mainContent.find('#everythingSearchResults');
                        var relTagsInner = $(data).find('#searchFragmentRelatedTags');
                        var result = resultsDivInner.attr('result');
                        if(result == 'S') {
                            existingData.append(resultsDivInner.html());
                            $('#everythingSearchResults > div').filter(function(index) {
                                return $(this).children().length < 1;
                            }).remove();
                            $('#searchRelatedTags').html(relTagsInner.html());
                        }
                        //else{
                        //    alert(resultsDivInner.attr('error'));
                        //}
                    },
                    error: function(xhr){
                        del.displayError(xhr.responseText);
                    }
                });
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }
        });
        return false;
    },
    searchStackLoadMore: function($this) {
        var keyword = $this.attr('query');
        var offset = parseInt($this.attr('offset'), 10);
        var filter = $this.attr('filter');
        var per_page_load_limit = parseInt($this.attr('per_page_load_limit'), 10);
        var total = parseInt($this.attr('total'), 10);
        var next_offset = offset + per_page_load_limit;
        var stackListDiv = $("#searchStackList");
        $.ajax({
            url: '/search/ws/stacks',
            type: 'POST',
            data: {
                'p': keyword,
                'offset': offset,
                'filter': filter
            },
            success: function(data) {
                var moreDataDiv = $(data).find('#loadMoreStackListDiv');
                var result = moreDataDiv.attr('result');
                if(result == 'S') {
                    stackListDiv.append(moreDataDiv.html());
                    if (next_offset >= total) {
                        $this.remove();
                    } else {
                        $this.attr('offset', next_offset);
                    }
                }
                //else{
                //    alert(moreDataDiv.attr('error'));
                //}
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }
        });
        return false;
    },
    searchLinksLoadMore: function($this) {
        var keyword = $this.attr('query');
        var offset = parseInt($this.attr('offset'), 10);
        var filter = $this.attr('filter');
        var per_page_load_limit = parseInt($this.attr('per_page_load_limit'), 10);
        var total = parseInt($this.attr('total'), 10);
        var next_offset = offset + per_page_load_limit;
        $.ajax({
            url: '/search/ws/links',
            type: 'POST',
            data: {
                'p': keyword,
                'offset': offset,
                'filter': filter
            },
            success: function(data) {
                var moreDataDiv = $(data).find('#loadMoreLinkListDiv');
                var result = moreDataDiv.attr('result');
                if(result == 'S') {
                    $('#srch1-bookmarklist').append(moreDataDiv.html());
                    if (next_offset >= total) {
                        $this.remove();
                    } else {
                        $this.attr('offset', next_offset);
                    }
                }
                //else{
                //    alert(moreDataDiv.attr('error'));
                //}
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }
        });
        return false;
    },
    removeSavedSearchLink: function($this) {
        var bundle = $this.attr('bundle');
        $.ajax({
            url: '/search/ws/delete_string',
            type: 'POST',
            data: {
                'bundle': bundle
            },
            success: function(data) {
                var savedSearchDiv = $('#savedSearchItem-' + bundle);
                var savedSearchList = $('#savedSearchList');
                if(data.result == 'S') {
                    savedSearchDiv.remove();
                }
                if ($('#savedSearchList > li').length == 0) {
                    $('#savedSearchButton').html("save search");
                    $('#saveSearch-saved').attr('id', 'saveSearch');
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }
        });
        return false;
    },
    updateJcropCoordinates: function(c) {
        $('#jcrop-x').val(c.x);
        $('#jcrop-y').val(c.y);
        $('#jcrop-x2').val(c.x2);
        $('#jcrop-y2').val(c.y2);
        $('#jcrop-w').val(c.w);
        $('#jcrop-h').val(c.h);
    },
    processJcropCoordinates: function() {
        $.ajax({
            url: '/settings/upload',
            type: 'POST',
            dataType: 'json',
            async: false,
            data: {
                x: $('#jcrop-x').val(),
                y: $('#jcrop-y').val(),
                x2: $('#jcrop-x2').val(),
                y2: $('#jcrop-y2').val(),
                w: $('#jcrop-w').val(),
                h: $('#jcrop-h').val(),
                img: $('#jcropTarget').attr("src")
            },
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    del.okDialog('image is being processed, change will take effect in a few minutes.');
                    window.location.href = '/settings';
                }
            },
            error: function() {
                alert('Sorry, try again later');
            }
        });
    },
    addNewTagWrapper: function($element){
        var tag = $.trim($element.val());
        if(tag.length){
            del.addNewTag(tag, $element);
        }
    },
    // Applies the tag bubble to the tags field when saving bookmarks.
    addNewTag: function(tag, $element){
        var newTag = tag.substring(0, tag.length);
        // First check if the user was trying to use space separated tags.
        var spacedTags = tag.split(' ');
        // VJ: I don't think this ever worked.
        //if(spacedTags.length > 2){
        if (false) {
            var $confirm = $('#confirmationDialog');
            $confirm.attr('title', 'Tags');
            $confirm.html(del.SEPARATE_TAGS_TEXT);
            $confirm.dialog({
                resizable: false,
                buttons: [{
                    text: 'yes',
                    click: function(){
                        for(var tag in spacedTags){
                            del.bubbleTag($('#saveTags').val(), tag, $element);
                        }
                        $confirm.dialog('close');
                    }
                },{
                    text: 'no',
                    click: function(){
                        del.bubbleTag($('#saveTags').val(), newTag, $element);
                        $confirm.dialog('close');
                    }
                }]
            });
            $confirm.dialog('open');
        }
        else{
            var oldTags = $('#saveTags').val();
            del.bubbleTag(oldTags, newTag, $element);

        }
    },
    //TODO: Be smart about what should be bubbled, i.e. don't bubble bigrams like San Francisco.
    bubbleTag: function(oldTags, newTag, $element){
        var $tagsField = $element.closest('#tagsField');
        if(!$tagsField.length){ // user clicked on recommended link.
            $tagsField = $element.closest('#recommendedField').siblings('#tagsField');
        }
        var oldTagsArray = []
        if (oldTags != undefined && oldTags.length > 2) {
            oldTagsArray = oldTags.split(',');
        }
        if($.inArray(newTag, oldTagsArray) == -1) {
            var newTagsInput = $tagsField.find('.newTagInputWrapper');
            newTagsInput.before('<li class="newTagItem"><a><div title="' + newTag + '" class="tagName">' +
                    newTag + '</div><span class="rm" title="Remove this tag"></span></a></li>');
            if (oldTags){
                $tagsField.find('#saveTags').val(oldTags + ',' + newTag);
            }
            else{
                $tagsField.find('#saveTags').val(newTag);
            }
        }
        $tagsField.find('#newTagsInput').val('');
    },
    deleteTag: function(oldTag, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/settings/tags/delete',
            type: 'POST',
            dataType: 'json',
            cache: false,
            data: { 'old_tag': oldTag },
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    del.okDialog('tag deleted, you will see changes shortly');
                    window.location.href = '/settings';
                }
            },
            error: function() {
                alert('Sorry, try again later');
            },
            complete: function() {
                if($loadingElement){
                    $loadingElement.html(prevHtml);
                }
            }
        });
    },
    initHomePage: function() {
        $('#tour li a').click(function(){
            var $this = $(this);
            var matchedPageClass = $this.attr('id');
            $this.parent().siblings().children().removeClass('selected');
            $this.addClass('selected');
            $this.parents('#tour').children('.introMessage').hide();
            $this.parents('#tour').find("." + matchedPageClass).show();
        });
        $('#magicboxform #addtag').focus(function() {
            del.focusInputBox($(this));
        });
        $('#magicboxform #addtag').blur(function() {
            del.blurInputBox($(this), 'type a tag');
        });
        $('#addLink, #lookupLink').live('focus', function() {
            del.focusInputBox($(this));
        });
        $('#addLink, #lookupLink').live('blur', function() {
            del.blurInputBox($(this), del.ENTER_LINK_PLACEHOLDER);
        });
        $('#newCustomSlice').focus(function(){
            if($(this).val() == 'add custom text'){
                $(this).val('');
            }
        });
        $('#related-tags .toggle-button').click(function(event) {
            var $relatedTags = $('#related-tags');
            if($relatedTags.hasClass('on')) {
                $relatedTags.removeClass('on').addClass('off');
            } else {
                $relatedTags.removeClass('off').addClass('on');
            }
            event.preventDefault();
        });
        $('#resetPasswordSend').click(function(event){
            event.preventDefault();
            del.resetPassword();
        });
        $('#oneClickSave').live('click', function(){
            del.oneClickSaveBookmark();
        });
        $('#savePrivate').live('change', function(){
            if($(this).is(':checked') && $('#saveToStack').val() != ''){
                del.okDialog(del.PUBLIC_STACK_WARNING);
                $(this).removeAttr('checked');
            }
        });
        $('#saveToStack').live('change', function(){
            if($('#savePrivate').is(':checked')){
                del.okDialog(del.PUBLIC_STACK_WARNING);
                $('#savePrivate').removeAttr('checked');
            }
        });
    },
    initSavePage: function() {
        $('#recommendedField .m').live('click', function() {
            var tag = $(this).attr('title');
            del.addNewTag(tag, $(this));
            $(this).parent().remove();
            return false;
        });
        $('#saveSaveBtn').click(function(){
            del.saveBookmark($('#backUrl').val(), $(this));
            return false;
        });
        $('#saveForm').submit(function() {
            return false;
        });
        $('#saveNextBtn').click(function() {
            $('#saveNextForm').submit();
            return false;
        });
    },
    selectBookmark: function($bookmark){
        $bookmark.find('.bulkSelect').css('background', '#d9e7b5');
    },
    deselectBookmark: function($bookmark){
        $bookmark.find('.bulkSelect').css('background', '#fff');
        $bookmark.find('.bulkSelect.withPrivate').css('background', '#eaeaea');
    },
    findSaveContainer: function(){
        if ($('.saveBody').length > 0){
            return $('.saveBody');
        }
        else{
            return $('.savePage');
        }
    },
    oneClickSaveBookmark: function(){
        var url = $('#saveUrl').val();
        var stackId = $('#self_stack_view #stack_view_stack_id').val();
        if(url && url != del.ENTER_LINK_PLACEHOLDER){
            del.saveConfirmDialog(url, stackId);
        }
        else{
            del.okDialog('please enter a URL.');
        }
    },
    saveConfirmDialog: function(url, targetStackId){
        $('#saveDialog0').show().draggable();
        var $saveContainer = del.findSaveContainer();
        $saveContainer.html(del.LOADING_IMAGE);
        var confirmData = { "url": url };

        $.ajax({
            url: '/save/extract_url_title',
            dataType: 'json',
            data: confirmData,
            success: function(data){
                if(data.title) {
                    confirmData.title = data.title;
                } else {
                    delete confirmData.title;
                }
                if(data.url) {
                    confirmData.url = data.url;
                }
                if(targetStackId) {
                    confirmData.target_stack_id = targetStackId;
                }
                $saveContainer.load('/save/confirm', confirmData,
                    function(response, status){
                    if(status == 'error'){
                        window.location.href='/register?next=save&url=' + url;
                    } else {
                        $('#saveTitle').focus();
                    }
                });
            },
            error: function(){
                window.location.href='/register?next=save&url=' + url;
            }
        });
    },
    saveBookmark: function(goToUrl, buttonElement) {
         // just in case the blur event didn't work on the last tag...
        del.addNewTagWrapper($('#newTagsInput'));

        var buttonHolder = buttonElement;
        var prevHtml = buttonHolder.html();
        buttonHolder.html(del.LOADING_IMAGE);
        var title = $('#saveTitle').val();
        var oldUrl = $('#oldSaveUrl').val();
        var url = $('#saveUrl').val();
        var tags = $('#saveTags').val();
        var note = $('#saveNotes').val();
        var isPrivate = $('#savePrivate').is(':checked');
        var csrf_token = $('#csrf_token').val();
        var jump = $('#jump').val();
        var stackId = $('#saveToStack').val();

        var createStackPopup = false;
        if (stackId == '.') {
            stackId = '';
            createStackPopup = true;
        }

        $.ajax({
            url: "/save",
            type: "POST",
            dataType: "json",
            data: { "url": url,
                "oldUrl": oldUrl,
                "title": title,
                "tags": tags,
                "note": note,
                "private": isPrivate,
                "stack_id": stackId,
                "csrf_token": csrf_token },
            success: function(data) {
                if(data.error){
                    del.okDialog(data.error_msg);
                }
                else if (createStackPopup && data.urlmd5){
                    $('#bookmarklist').prepend("<li id='item-"+data.urlmd5+"' class='post'><input type='checkbox' checked='checked'></li>");
                    $('#globalCreateStackBtn').click();
                }
                else if (jump == 'doclose'){
                    window.close();
                }
                else if (goToUrl && goToUrl != 'None'){
                    window.location.href = '/' + del.getLoggedInUsername();
                }
                else if (window.location.pathname.indexOf('/' + del.getLoggedInUsername()) != -1){
                    window.location.reload();
                }
                else if(data.rendered_link) {
                    $('#self_stack_view #stackLinkSection').prepend(data.rendered_link).hide().fadeIn('slow');
                    del.incrementLinkCount();
                    del.clearSaveDialog();
                }
                else{
                    del.clearSaveDialog();
                }
            },
            complete: function(){
                buttonHolder.html(prevHtml);
            }
        });
    },
    clearSaveDialog: function(){
        $('.saveDialog').fadeOut();
        $('.saveBody').html('');
    },
    decrementLinkCount: function() {
        var $linkCountVal = $('#self_stack_view #linkCountValue');
        var linkCountStr = $linkCountVal.text();
        if(linkCountStr) {
            var linkCount = parseInt($.trim(linkCountStr));
            linkCount--;
            $linkCountVal.text(linkCount);
        }
    },
    incrementLinkCount: function() {
        var $linkCountVal = $('#self_stack_view #linkCountValue');
        var linkCountStr = $linkCountVal.text();
        if(linkCountStr) {
            var linkCount = parseInt($.trim(linkCountStr));
            linkCount++;
            $linkCountVal.text(linkCount);
        }
    },
    resetPassword: function(){
        var password1 = $('#resetNewPassword').val();
        var password2 = $('#resetNewPasswordRetry').val();
        var userid = $('#resetId').val();

        if (password1 != password2){
            del.okDialog('passwords must match.');
        }
        else{
            $.ajax({
                url: '/settings/passwordresetemail',
                type: 'POST',
                data: {
                    'newpassword' : password1,
                    'password_retry' : password2,
                    'userid' : userid
                },
                success: function(data){
                    if(data.error){
                        alert(data.error_msg);
                    }
                    else{
                        window.location.href = '/settings/pw/success';
                    }
                }
            });
        }
    },
    
    
    initBanner: function() {
    
        $('#userNav li.dropdown').not(".loggedOut").hoverIntent(function() {
            //event.stopPropagation();
            var nameWidth = $('#userNav li.dropdown').width();
            $(this).find('ul').css({'width': nameWidth-7 });
            $(this).siblings().contents('ul').slideUp('fast', function() {$(this).parent().removeClass('selected'); });
            $(this).contents('ul').slideDown('fast');
            $(this).addClass('selected');
        }, function() {
            $(this).contents('ul').slideUp('fast', function() {$(this).parent().removeClass('selected'); });
        });
    },
    swapTracks: function($old, $new) {
        var oldId = '#track' + $old.find('span').html();
        $old.removeClass('current');
        $(oldId).hide();

        $new.addClass('current');
        var newId = '#track' + $new.find('span').html();
        $(newId).show();
    },
    focusInputBox: function($element) {
        $element.val('').css('color', '#000').parent().addClass('on');
    },
    blurInputBox: function($element, defaultText) {
        var value = $element.val();
        if($.trim(value) == '') {
            $element.val(defaultText).css('color','#666').parent().removeClass('on');
        }
    },
    submitLogin: function(){
        $('#loginError').hide();
        $('#delLoading').show();
        var username = $('#username').val();
        if (!username){
            username = $('#login_username').val();
        }
        var password = $('#password').val();
        if(!password){
            password = $('#login_password').val();
        }

        $.ajax({
            url: '/login',
            data: { 'username': username, 'password': password },
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.href = '/' + data.username;
                }
            },
            error: function() {
                alert('unknown error');
            },
            complete: function(){
                $('#delLoading').hide();
            }
        });
    },
    validatePassword: function(password){
        // Passwords should be > 5, and contain letters and at least a number.
        return password.length > 5 && password.match(/\d+/);
    },
    validateEmail: function(email){
        var emailReg = /^([A-Za-z0-9_\-\.\+])+@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        return email.length > 7 && emailReg.test(email);
    },
    changePasswordSubmit: function(){
        var passwordValid = $('#passwordMatchValid');
        passwordValid.hide();

        var userid = $('#change-pw #userid').val();
        var oldpassword = $('#change-pw #oldpassword').val();
        var newpassword = $('#change-pw #password1').val();
        var verifypassword = $('#change-pw #password2').val();

        if(oldpassword.length == 0 || newpassword.length == 0 || verifypassword.length == 0){
            passwordValid.show().html('Password fields cannot be blank.');
        }
        else if(oldpassword == newpassword){
            passwordValid.show().html('New password is same as current password.');
        }
        else if(!del.validatePassword(newpassword)){
            passwordValid.show().html('Password must contain at least one of letters, numbers, and symbols.');
        }
        else{
            $.ajax({
                url: '/settings/profile/changepw',
                type: 'POST',
                data: {
                    'userid': userid,
                    'oldpassword': oldpassword,
                    'newpassword': newpassword
                },
                success: function(data) {
                    if(data.result == true) {
                        del.okDialog('your password has been successfully changed.');
                        window.location.href = '/settings';
                    }
                    else{
                        alert(data.error);
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                }
            });
        }
    },
    updateEmailKeySubmit: function(){
        var email_key = $('#email_code #email_secret_key').val();

            $.ajax({
                url: '/settings_emailkey',
                type: 'POST',
                data: {
                    'email_secret_key': email_key
                },
                success: function(data) {
                    if (data.error) {
                        del.okDialog(data.error_msg);
                    }
                    else {
                        window.location.href = '/settings';
                    }
                },
                error: function(xhr){
                    del.displayError(xhr.responseText);
                }
            });
    },
    createStack: function(stackTitle, elementsJson, description, successFunction, showLoading){
        if(showLoading) {
            $('#delLoading').show();
        }
        var stackurl = $('#stackurl').val();
        var data = {
            'title' : stackTitle
        };
        if(elementsJson) {
            data.elements_json = elementsJson;
        }
        if(description) {
            data.desc = description;
        }
        /*
        if(stackurl) {
            data.reply_to_stack_url = stackurl;
        }
        */
        if(!successFunction) {
            successFunction = function(data) {
               if(data.error){
                    del.displayError(data.error_msg);
               } else{
                    window.location.href = '/stacks/view/' + data.enc_stack_id + '?editMode=true';
               }
            }
        }
        $.ajax({
            url: '/create',
            type: 'POST',
            data: data,
            success: successFunction,
            error: function(xhr){
                del.displayError(xhr.responseText);
            },
            complete: function(){
                if(showLoading) {
                    $('#delLoading').hide();
                }
                $('#stackurl').val('');
            }
        });
    },
    jsonizeLinks: function(links){
        var stack_content_list = [];
        for(var link in links){
            var element = {};
            element.type = 'L';
            element.url = links[link];
            stack_content_list.push(element);
        }
        return $.toJSON(stack_content_list);
    },
    updateStack: function(stackId, stackTitle, stackDescription, elementsJson, stackThumb, penname_id){
        $('#delLoading').show();
        var data = {};
        if(stackTitle) {
            data.title = stackTitle;
        }
        if(stackDescription) {
            data.desc = stackDescription;
        }
        if(stackThumb) {
            data.thumb = stackThumb;
        }
        if(penname_id) {
            data.penname_id = penname_id;
        }
        if(elementsJson) {
            data.elements_json = elementsJson;
        }
        $.ajax({
            url: '/stacks/update/' + stackId,
            type : 'POST',
            data: data,
            success: function(data){
                if(data.error){
                    alert(data.error_msg);
                }
                else{
                    window.location.href = '/stacks/view/' + stackId;
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            },
            complete: function(){
                $('#delLoading').hide();
            }
    });
    },
    
    /*
    addLinkToStack: function(stack_id, url, title, $loadingElement) {
        if(stack_id == 'new'){
            window.location.href='/create?urls=' + url;
        }
        else{
            var prevHtml;
            if($loadingElement){
                prevHtml = $loadingElement.html();
                $loadingElement.html(del.LOADING_DIV);
            }
            $.ajax({
                url: '/stacks/addlink/' + stack_id,
                type: 'POST',
                dataType: 'json',
                data: { 'stack_url': url, 'title' : title },
                success: function(data) {
                    if(data.error) {
                        del.displayError(data.error_msg);
                    }
                    else{
                        prevHtml = 'added to stack:  <a href="/stacks/view/' + stack_id + '">' + data.stack_name + '</a>';
                    }
                },
                error: function(xhr) {
                    del.displayError(xhr.responseText);
                },
                complete: function() {
                    if($loadingElement) {
                        $loadingElement.html(prevHtml);
                    }
                }
            });
        }
    },
    */
    getTagsFromBookmarkTagchain: function(tagchain){
        var urlTags = '';
        $.each(tagchain, function(){
            urlTags += $(this).text() + " ";
        });
        return $.trim(urlTags);
    },
    getLoggedInUsername: function(){
        return $('#logged_in_username').attr("name");
    },
    deleteBookmark: function(url, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/delete',
            type: 'POST',
            dataType: 'json',
            cache: false,
            data: { 'url': url, 'csrf_token': $loadingElement.attr('csrf_token') },
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    deleteLinks: function(url_list, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/delete',
            type: 'POST',
            dataType: 'json',
            cache: false,
            data: { 'urls': url_list },
            success: function(data) {
                if(successFunc) {
                    successFunc.call();
                }
            },
            complete: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
            }
        });
    },
    refetchStack: function(stack_id, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/admin/stack/refetch/' + stack_id,
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    featureStack: function(stack_id,$loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/admin/stack/feature/' + stack_id,
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    unfeatureStack: function(stack_id, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/admin/stack/unfeature/' + stack_id,
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    setFeaturedThumbnail: function(img_url, user_id, stack_id, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: "/admin/stack/feature_thumb",
            type: 'POST',
            dataType: 'json',
            cache: false,
            data: { 'url': img_url, 'user_id': user_id, 'stack_id': stack_id },
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    del.okDialog('featured thumbnail set.');
                }
            },
            complete: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
            }
        });
    },
    featureLink: function(md5,$loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/admin/link/feature/' + md5,
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    unfeatureLink: function(md5, $loadingElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/admin/link/unfeature/' + md5,
            type: 'POST',
            dataType: 'json',
            cache: false,
            success: function(data) {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            }
        });
    },
    rotateFeaturedLinks: function() {
        $('#delLoading').show();
        $.ajax({
            url: '/admin/feature/links/rotate',
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    rotateFeaturedStacks: function() {
        $('#delLoading').show();
        $.ajax({
            url: '/admin/feature/stacks/rotate',
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    refreshFeaturedLinks: function() {
        $('#delLoading').show();
        $.ajax({
            url: '/admin/feature/links/refresh',
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    refreshFeaturedStacks: function() {
        $('#delLoading').show();
        $.ajax({
            url: '/admin/feature/stacks/refresh',
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    reorderFeaturedLink: function(linkMd5, afterLinkMd5) {
        $('#delLoading').show();
        var data = {
            link_id : linkMd5
        };
        if(afterLinkMd5) {
            data.after_link_id = afterLinkMd5;
        }
        $.ajax({
            url: '/admin/feature/links/reorder',
            type: 'POST',
            dataType: 'json',
            data : data,
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    reorderFeaturedStack: function(stackId, afterStackId) {
        $('#delLoading').show();
        var data = {
            stack_id : stackId
        };
        if(afterStackId) {
            data.after_stack_id = afterStackId;
        }
        $.ajax({
            url: '/admin/feature/stacks/reorder',
            type: 'POST',
            dataType: 'json',
            data : data,
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    window.location.reload();
                }
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    addSubscription: function(tagStr, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $('#delLoading').show();
        $.ajax({
            url: '/settings/subscriptions/add',
            type: 'POST',
            dataType: 'json',
            data: { 'subtag': tagStr  },
            cache: false,
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if(successFunc) {
                        successFunc.call();
                    }
                }
            },
            error: function() {
                alert('unknown error');
            },
            complete: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
                $('#delLoading').hide();
            }
        });
    },
    removeSubscription: function(tagStr, $loadingElement, $removeElement) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/settings/subscriptions/remove',
            type: 'POST',
            dataType: 'json',
            data: { 'subtag': tagStr, 'csrf_token': $loadingElement.attr('csrf_token') },
            cache: false,
            success: function(data) {
                if(data.error) {
                    alert(data.error_msg);
                } else {
                    if($removeElement) {
                        $removeElement.remove();
                    }
                }
            },
            error: function() {
                alert('unknown error');
            },
            complete: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
            }
        });
    },
    shareInbox: function(username, url, title, message, numSaves, csrf_token) {
        $('#delLoading').show();
        $.ajax({
            url: '/share',
            type: 'POST',
            dataType: 'json',
            data: {
                receiver: username,
                url: url,
                title: title,
                message: message,
                num_saves: numSaves,
                csrf_token: csrf_token
            },
            success: function(result){
                if(result.error) {
                    alert(result.error_msg);
                }
                else {
                    del.okDialog('you have shared the bookmark with ' + username);
                    $('#shareDialog').dialog('close');
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    shareStack: function(enc_stack_id, recipients, message, csrf_token) {
        $('#delLoading').show();
        var postData = {'enc_stack_id': enc_stack_id, 'recipients': recipients, 'csrf_token': csrf_token};
        if(message) {
            postData.message = message;
        }
        $.ajax({
            url: '/share/stack',
            type: 'POST',
            dataType: 'json',
            data: postData,
            success: function(result){
                if(result.error) {
                    alert(result.error_msg);
                }
                else {
                    del.okDialog('you have successfully shared the stack!');
                    $('#shareStackDialog, #shareDialog').dialog('close');
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    shareLink: function(url, enc_stack_id, recipients, message, csrf_token) {
        $('#delLoading').show();
        var postData = {'url': url, 'enc_stack_id': enc_stack_id, 'recipients': recipients, 'csrf_token': csrf_token};
        if(message) {
            postData.message = message;
        }
        $.ajax({
            url: '/share/link',
            type: 'POST',
            dataType: 'json',
            data: postData,
            success: function(result){
                if(result.error) {
                    alert(result.error_msg);
                }
                else {
                    del.okDialog('you have successfully shared this link!');
                    $('#shareStackDialog, #shareDialog').dialog('close');
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            },
            complete: function() {
                $('#delLoading').hide();
            }
        });
    },
    displayError: function(errorText){
        var $error = $('#errorDialog');
        $error.attr('title', del.ERROR_TITLE_TEXT);
        $('#errorBody').html(errorText);
        $error.dialog({
            modal: true,
            width: 300,
            position: 'top',
            buttons : [{
                text: 'ok',
                click: function(){
                    window.location.reload();
                }
            }]
        });
        $error.dialog('open');
    },
    getCheckedUrls: function(checked_links) {
        var urls = [];
        checked_links.each(function(i) {
            urls[i] = $(this).val();
        });
        return urls.join(",");
        //return false;
    },
    quickSave: function(url_list, isPrivate, $loadingElement, successFunc) {
        var prevHtml;
        if($loadingElement) {
            prevHtml = $loadingElement.html();
            $loadingElement.html(del.LOADING_IMAGE);
        }
        $.ajax({
            url: '/save/quick',
            type: 'POST',
            data: {'urls': url_list, 'private': isPrivate},
            dataType: 'json',
            cache: false,
            success: function(data) {
                if(successFunc) {
                    successFunc.call();
                }
            },
            error: function(data) {
                alert('Sorry, unknown error. Please try again');
            },
            complete: function() {
                if($loadingElement) {
                    $loadingElement.html(prevHtml);
                }
            }
        });
    },
    resetSaveDialog: function($container){
        $container.html(del.LOADING_IMAGE).load('/save/reset');
        setTimeout(function(){$('#saveUrl').focus();}, 250);
    },
    okDialog: function(sentence){
        $('.okDialog').html(sentence);
        $('.okDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 300,
            zIndex: 5000,
            modal: true,
            stack: true,
            buttons : [{
                text: 'ok',
                click: function(){
                    $(this).dialog('close');
                }
            }]
        });
        $('.okDialog').dialog('open');
    },
    confirmDialog: function(question, url, successButtonName, successFunc){
        $('.confirmDialog').html(question);
        $('.confirmDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 300,
            zIndex: 5000,
            modal: true,
            stack: true,
            buttons : [{
                text: 'cancel',
                click: function(){
                    $(this).dialog('close');
                }
            }, 
            {
                text: successButtonName,
                click: function(){
                    if(url){
                        $('#delLoading').show();
                        $.ajax({
                            url: url,
                            success: function(data){
                                if(successFunc){
                                    successFunc.call(this, data);
                                }
                            },
                            complete: function(){
                                $('#delLoading').hide();
                            }
                        });
                    }
                    else{
                        successFunc.call();
                    }
                }
            } ]
        });

        $('.confirmDialog').dialog('open');
        $('.confirmDialog').parent().find('button:contains("cancel")').addClass('cancel');
    },
    filterOutDuplicates: function(array){
        return $.grep(array, function(element,index){
            return $.inArray(element,array) === index;
        });
    },
    checkAllBookmarks: function(){
        $("input[type='checkbox']").attr('checked', 'checked');
        del.selectBookmark($('.post'));
    },
    uncheckAllBookmarks: function(){
        $("input[type='checkbox']").removeAttr('checked');
        del.deselectBookmark($('.post'));
    },
    populate_recent_shares: function() {
        $.ajax({
            'url': '/share/ws/recent',
            'type': 'GET',
            'dataType': 'json',
            'cache': false,
            success: function(data) {
                if(data.error && data.error == 'NOT_LOGGED_IN') {
                    $('#shareDialog').dialog('close');
                    del.okDialog('please log in first');
                } else {
                    if(data.recent_shares && data.recent_shares.length > 0) {
                        var $shareSelect = $('#shareRecentRecipients');
                        for(var recent_share in data.recent_shares) {
                            $shareSelect.append($('<option></option>').text(data.recent_shares[recent_share]));
                        }
                        $shareSelect.selectBox();
                        $('#recentShares').show();
                    }
                }
            }
        });
    },
    convertBookmarkPrivacy: function(md5List, makePublic){
        $.ajax({
            url: '/posts/convert_privacy',
            data: {
                urlm5s: md5List,
                makePublic: makePublic
            },
            type: 'POST',
            success: function(data){
                if(data.success == 'true'){
                    window.location.reload();
                }
                else{
                    alert(data.error);
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }

        });
    },
    deleteBookmarks: function(md5List){
        $.ajax({
            url: '/posts/delete',
            data: {
                urlm5s: md5List
            },
            type: 'POST',
            success: function(data){
                if(data.success == 'true'){
                    window.location.reload();
                }
                else{
                    alert(data.error);
                }
            },
            error: function(xhr){
                del.displayError(xhr.responseText);
            }

        });
    },
    nl2ptags: function(str) {
        // EVK: following is adapted from stackoverflow
        var paragraphs = str.split(/(\n\n)+/);
        var outParas = [];
        for (var i=0; i<paragraphs.length ; i++) {
            var lines = paragraphs[i].split(/\n/);
            var outLines = [];
            for(var j=0; j<lines.length; j++) {
                // The temporary <div/> is to perform HTML entity encoding reliably.
                // document.createElement() is *much* faster than jQuery('<div/>')
                // http://stackoverflow.com/questions/268490/
                //
                // You don't need jQuery but then you need to struggle with browser
                // differences in innerText/textContent yourself
                var line = jQuery(document.createElement('div')).text(lines[j]).html();
                line = $.trim(line);
                if(line) {
                    outLines.push(line);
                }
            }
            outParas.push('<p>' + outLines.join('<br/>') + '</p>')
        }
        return outParas.join('');
    },
    openRenameTagsDialog: function(){
        $('#renameBookmarkTagsDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 600,
            zIndex: 5000,
            modal: true,
            buttons : [{
                text: 'cancel',
                click: function(){
                    $(this).dialog('close');
                }
            },
            {
                text: 'save',
                click: function(){
                    // If the selector field is empty, try the input field.
                    var saveButton = $('#renameBookmarkTagsDialog').parent().find('button:contains("save")');
                    var prevHtml = saveButton.html();
                    saveButton.html(del.LOADING_IMAGE);
                    var oldTag = $.trim($('#oldTagSelector').val());
                    if (oldTag.length == 0){
                        oldTag = $.trim($('#renameTags #saveTags').val());
                    }
                    var newTag = $.trim($('#new_tag').val());
                    $.post('/settings/tags/rename', {
                        old_tag: oldTag,
                        new_tag: newTag
                    }, function(data){
                        if(data.error){
                            del.okDialog(data.error_msg);
                        }
                        else{
                            window.location.href='/' + del.getLoggedInUsername();
                        }
                    });
                    saveButton.html(prevHtml);
                }
            }],
            open: function(){
                $('#renameBody').html(del.LOADING_IMAGE).load('/settings/tags/rename');
            },
            close: function(){
                $('#renameBody').html('');
            }
        });
        $('#renameBookmarkTagsDialog').dialog('open');
        $('#renameBookmarkTagsDialog').parent().find('button:contains("cancel")').addClass('cancel');
    },
    openRemoveBookmarkDialog: function(linkList, data){
        $('#removeBookmarkTagsDialog').dialog({
            autoOpen: false,
            resizable: false,
            width: 465,
            zIndex: 5000,
            modal: true,
            title: 'remove tags',
            buttons : [{
                text: 'cancel',
                click: function(){
                    $(this).dialog('close');
                }
            },
            {
                text: 'remove',
                click: function(){
                    var tags = $('#saveTags').val();
                    if(tags.length > 0){
                        $.post('/posts/tags/remove', {
                            md5s: linkList.toString(),
                            tags: tags
                        },
                        function(){
                            del.okDialog('tags removed successfully.');
                            window.location.reload();
                        }, 'json');
                    }
                    $(this).dialog('close');
                }
            }],
            open: function(){
                var dupeTags = encodeURIComponent(data.duplicate_tags.join(','));
                $('#removeBody').html(del.LOADING_IMAGE);
                $('#removeBody').load('/posts/tags/load?tags=' + dupeTags);
            },
            close: function(){
                $('#removeBody').html('');
            }
        });
        $('#removeBookmarkTagsDialog').dialog('open');
        $('#removeBookmarkTagsDialog').parent().find('button:contains("cancel")').addClass('cancel');
    },
    callAddLinksToStack: function(stackId, md5s, successFunction, showLoading) {
        var data = {};
        if(md5s) {
            data.md5s = md5s.join(',');
        }
        if(showLoading) {
            $('#delLoading').show();
        }
        $.ajax({
                url: '/stacks/add/' + stackId,
                data: data,
                type: 'POST',
                success: successFunction,
                error: function(xhr){
                    del.displayError(xhr.responseText);
                },
                complete: function(){
                    if(showLoading) {
                        $('#delLoading').hide();
                    }
                }
        });
    }
};
