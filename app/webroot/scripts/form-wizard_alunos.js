var FormWizard = function () {


    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }

            function format(state) {
                if (!state.id) return state.text; // optgroup
                return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
            }

            var form = $('#AlunoNovoForm');
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);

            form.validate({
                doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    /*
                    'data[Aluno][nome]': {
                        required: true,
                        minlength: 4
                    },
                    'data[Aluno][rg]': {
                        required: true,
                        maxlength: 9
                    },
                    'data[Aluno][sexo]': {
                        required: true
                    },
                    'data[Aluno][aniversario]': {
                        required: true
                    },
                    'data[Aluno][email]': {
                        email: true
                    },                    
                    'data[Aluno][email_responsavel]': {
                        email: true
                    },                    
                    'data[Aluno][nome_responsavel]': {
                        required: true
                    },                    
                    'data[Aluno][cpf_responsavel]': {
                        required: true,
                        maxlength: 11
                    },                    
                    'data[Aluno][tel_principal]': {
                        required: true
                    },                    
                    'data[Aluno][filiacao]': {
                        required: true
                    },    
                    */
                },

                messages: { // custom messages for radio buttons and checkboxes
                    'data[Aluno][aniversario]': {
                        required: " "
                    }
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    if (element.attr("name") == "data[Aluno][sexo]") { // for uniform radio buttons, insert the after the given container
                        error.insertAfter("#form_sexo_error");
                    } else if (element.attr("name") == "payment[]") { // for uniform radio buttons, insert the after the given container
                        error.insertAfter("#form_payment_error");
                    } else {
                        error.insertAfter(element); // for other inputs, just perform default behavior
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    success.hide();
                    error.show();
                    App.scrollTo(error, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    if (label.attr("for") == "gender" || label.attr("for") == "payment[]") { // for checkboxes and radio buttons, no need to show OK icon
                        label
                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove(); // remove error label here
                    } else { // display success icon for other inputs
                        label
                            .addClass('valid') // mark the current input as valid and display OK icon
                        .closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    }
                },

                submitHandler: function (form) {
                    success.show();
                    error.hide();
                    form.submit();
                    //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax
                }

            });

            var displayConfirm = function() {
                $('#tab5 .form-control-static', form).each(function(){
                    var input = $('[name="'+$(this).attr("data-display")+'"]', form);
                    if (input.is(":text") || input.is("textarea")) {
                        $(this).html(input.val());
                    } else if (input.is("select")) {
                        $(this).html(input.find('option:selected').text());
                    } else if (input.is(":radio") && input.is(":checked")) {
                        $(this).html(input.attr("data-title"));
                    } else if ($(this).attr("data-display") == 'sexo') {
                        var payment = [];
                        $('[name="data[Aluno][sexo]"]').each(function(){
                            payment.push($(this).attr('data-title'));
                        });
                        $(this).html(payment.join("<br>"));
                    }
                });
            }

            var handleTitle = function(tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                // set wizard title
                $('.step-title', $('#form_wizard_1')).text('Etapa ' + (index + 1) + ' de ' + total);
                // set done steps
                jQuery('li', $('#form_wizard_1')).removeClass("done");
                var li_list = navigation.find('li');
                for (var i = 0; i < index; i++) {
                    jQuery(li_list[i]).addClass("done");
                }

                if (current == 1) {
                    $('#AlunoNovoForm').find('.button-previous').hide();
                } else {
                    $('#AlunoNovoForm').find('.button-previous').show();
                }

                if (current >= total) {
                    $('#AlunoNovoForm').find('.button-next').hide();
                    $('#AlunoNovoForm').find('.button-submit').show();
                    displayConfirm();
                } else {
                    $('#AlunoNovoForm').find('.button-next').show();
                    $('#AlunoNovoForm').find('.button-submit').hide();
                }
                App.scrollTo($('.page-title'));
            }

            // default form wizard
            $('#AlunoNovoForm').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    success.hide();
                    error.hide();
                    if (form.valid() == false) {
                        return false;
                    }
                    handleTitle(tab, navigation, clickedIndex);
                },
                onNext: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    if (form.valid() == false) {
                        return false;
                    }

                    handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#AlunoNovoForm').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            $('#AlunoNovoForm').find('.button-previous').hide();
            $('#AlunoNovoForm .button-submit').click(function () {                
                alert('Finished! Hope you like it :)');
            }).hide();
        }

    };

}();