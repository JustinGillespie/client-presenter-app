jQuery ->

	#
	# Editable Fields
	#

	body = $('body')
	editable = $('.editable')
	
	body.on 'dblclick', '.editable', (e) ->
		field = $(this).find('.editable-field')
		field.attr
			'disabled'  : false
			'data-save' : field.val()
		field.removeClass('unselected').focus()

	body.on 'blur', '.editable-field', (e) -> trigger_event $(this)
	body.on 'keypress', '.editable-field', (e) -> 
		if e.keyCode == 13
			e.preventDefault()
			$(e.currentTarget).trigger('blur')

	trigger_event = (field) ->
		if field.val() != "" and field.val() != field.attr('data-save')
			field.closest('form').find('input[type="submit"]').trigger('click')
		else
			field.val( field.attr('data-save') )
		field.removeAttr('data-save').attr('disabled', true).addClass('unselected')

	#
	# Progress Bar
	#

	ui_progress = $('#ui-progress')

	$('.multi-upload').fileupload
		dataType: "script"
		start: (e, data) -> ui_progress.show()
		stop: (e, data) -> ui_progress.hide()
		add: (e, data) ->
			types = /(\.|\/)(gif|jpe?g|png)$/i
			file = data.files[0]
			if types.test(file.type) || types.test(file.name)
				data.submit()
			else
				alert("#{file.name} is not a gif, jpeg, or png image file")
		progress: (e, data) ->
			progress = parseInt(data.loaded / data.total * 100, 10)
			console.log(progress)
			ui_progress.find('.bar').css('width', progress + '%')



