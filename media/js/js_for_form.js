$(document).ready(function(){
	function add_default_input(id, name) {
		if($(id).val() == ''){ $(id).val(name); };
		$(id).click(function(){ if ($(this).val() == name) { $(this).val(''); }; });
		$(id).blur(function(){ if ($(this).val() == '') { $(this).val(name); }; });
	};
	
	add_default_input('#id_username', 'Имя пользователя');
	add_default_input('.block-front #id_username', 'Имя пользователя');
	add_default_input('.block-front #id_password', 'Пароль');
	add_default_input('#id_password', 'Пароль');
	add_default_input('.block-front #id_password', 'Пароль');
	add_default_input('.help_text #id_username', 'Имя пользователя');
	add_default_input('.help_text #id_level', 'Номер класса');
	
	add_default_input('#id_password1', 'Пароль');
	add_default_input('#id_password2', 'Пароль');
	
	add_default_input('.search #id_title', 'Тема');
	add_default_input('.search #id_date', 'Дата');
	
	add_default_input('#id_name', 'Имя и фамилия');
	add_default_input('#id_email', 'E-mail');
	add_default_input('#id_phone', 'Телефон');
	add_default_input('#id_captcha_1', 'Код защиты');
	add_default_input('#id_text', 'Сообщение');
});
