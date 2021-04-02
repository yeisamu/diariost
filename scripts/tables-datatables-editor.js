var TablesDataTablesEditor = {

	/*restoreRow: function (oTable, nRow) {
		var aData = oTable.fnGetData(nRow);
		var jqTds = $('>td', nRow);
		for ( var i=0, iLen=jqTds.length ; i<iLen ; i++ ) {
			console.log(aData[i]);
			oTable.fnUpdate( aData[i], nRow, i, false );
		}
		oTable.fnDraw();
	},

	editRow: function (oTable, nRow) {
		var aData = oTable.fnGetData(nRow);
		var jqTds = $('>td', nRow);
		jqTds[0].innerHTML = '';
		jqTds[1].innerHTML = '<div class="inputer"><div class="input-wrapper"><input type="text" value="'+aData[1]+'" class="form-control input-sm"></div></div>';
		jqTds[2].innerHTML = '<div class="inputer"><div class="input-wrapper"><input type="text" value="'+aData[2]+'" class="form-control input-sm"></div></div>';
		jqTds[3].innerHTML = '<div class="inputer"><div class="input-wrapper"><input type="text" value="'+aData[3]+'" class="form-control input-sm"></div></div>';
		jqTds[4].innerHTML = '<a href="javascript:;" class="dt-edit">Guardar</a>';
		jqTds[5].innerHTML = '<a href="javascript:;" class="dt-cancel">Cancelar</a>';
		jqTds[6].innerHTML = '<a href="javascript:;" class="imprimir">Imprimir</a>';
		Layout.initInputerBorders();
	},

	saveRow: function (oTable, nRow) {
		var jqInputs = $('input', nRow);
		oTable.fnUpdate( '<input type="checkbox" class="checkboxes" value="1">', nRow, 0, false );
		oTable.fnUpdate( jqInputs[0].value, nRow, 1, false );
		oTable.fnUpdate( jqInputs[1].value, nRow, 2, false );
		oTable.fnUpdate( jqInputs[2].value, nRow, 3, false );
		oTable.fnUpdate( '<button class="btn btn-primary btn-xs dt-edit"><span class="glyphicon glyphicon-pencil"></span></button>', nRow, 4, false );
		oTable.fnUpdate( '<button class="btn btn-danger btn-xs dt-delete"><span class="glyphicon glyphicon-trash"></span></button>', nRow, 5, false );
		oTable.fnUpdate( '<button class="btn btn-success btn-xs imprimir"><span class="glyphicon glyphicon-print"></span></button>', nRow, 6, false );
		oTable.fnDraw();
	},*/

	fnGetSelected: function (oTable) {
		return oTable.$('tr.selected');
	},

	deleteButtonState: function (nSelected) {
		if(nSelected>0)
			$('#dt-deleteall').prop('disabled', false)
		else {
			$('#dt-deleteall').prop('disabled', true);
			$('.checkable-group').prop('checked', false);
		}
	},

	editor: function () {
		/*var oTable = $('.datatables-crud').dataTable({
			'columns': [{
				'orderable': false
				}, {
				'orderable': true
				}, {
				'orderable': true
				}, {
				'orderable': true
				}, {
				'orderable': false
				}, {
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
				},{
				'orderable': false
			}],
			//'order': [
				//[1, "asc"]
			//],
			'dom': '<"toolbar pull-left">frtip'
		});*/
		$('div.toolbar').html('<button id="dt-new" class="btn btn-primary btn-sm margin-bottom-10">Add New Record</button> <button id="dt-deleteall" class="btn btn-danger btn-sm margin-bottom-10" disabled>Delete selected</button>');
		var nEditing = null,
				nCreating = false,
				nSelected = 0;

		/*oTable.on('click', 'tbody input:checkbox', function (e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).parents('tr').toggleClass('selected');
			$(this).is(':checked') ? nSelected++ : nSelected--;
			TablesDataTablesEditor.deleteButtonState(nSelected);
		});

		$('#dt-new').click( function (e) {
			e.preventDefault();
			var aiNew = oTable.fnAddData( [ '', '', '', '',
			'<button class="btn btn-primary btn-xs dt-edit"><span class="glyphicon glyphicon-pencil"></span></button>', '<button class="btn btn-danger btn-xs dt-delete"><span class="glyphicon glyphicon-trash"></span></button>', '<button class="btn btn-success btn-xs imprimir"><span class="glyphicon glyphicon-print"></span></button>' ] );
			var nRow = oTable.fnGetNodes( aiNew[0] );
			TablesDataTablesEditor.editRow( oTable, nRow );
			nEditing = nRow;
			nCreating = true;
		});*/

		/*$('#dt-deleteall').click( function (e) {
			e.preventDefault();
			if (confirm("Are you sure to delete selected rows ?") == false) {
				return;
			}
			var anSelected = TablesDataTablesEditor.fnGetSelected( oTable );
			for (var i = 0; i < anSelected.length; i++) {
				oTable.fnDeleteRow(anSelected[i]);
			};
			alert("Selected rows were deleted! Do not forget to do some ajax to sync with backend :)");
			$('.checkable-group').prop('checked', false);
			nSelected = 0;
		});*/

		/*oTable.on('click', '.dt-cancel', function (e) {
			e.stopPropagation();
			e.preventDefault();
			if (nCreating) {
				oTable.fnDeleteRow(nEditing);
				nCreating = false;
			} else {
				$(this).parents('tr').removeClass('selected');
				TablesDataTablesEditor.restoreRow(oTable, nEditing);
				nEditing = null;
				nSelected--;
			}
		});*/

		/*oTable.on('click', '.dt-delete', function (e) {
			e.stopPropagation();
			e.preventDefault();
			if (confirm("Are you sure to delete this row ?") == false) {
				return;
			}
			var nRow = $(this).parents('tr')[0];
			oTable.fnDeleteRow(nRow);
			alert("Deleted! Do not forget to do some ajax to sync with backend :)");
		});*/

		/*oTable.on('click', '.imprimir', function (e) {
			
			alert("Funciona esta mierda :)");
		});*/

		/*oTable.on('click', '.dt-edit', function (e) {
			e.stopPropagation();
			e.preventDefault();

			
			var nRow = $(this).parents('tr')[0];

			if (nEditing !== null && nEditing != nRow) {
					
					TablesDataTablesEditor.restoreRow(oTable, nEditing);
					TablesDataTablesEditor.editRow(oTable, nRow);
					nEditing = nRow;
			} else if (nEditing == nRow && this.innerHTML == "Save") {
					
					TablesDataTablesEditor.saveRow(oTable, nEditing);
					nEditing = null;
					 var formData = new FormData( $('#agrega_item')[0] );
					var url=$('#base_url').val();
					     $.ajax({
					         url: url+'ssifex/grabarorden',
					         type: 'POST',
					         data: formData,
					         dataType: 'json',
					         xhr: function() {  
					             // custom xhr
					             myXhr = $.ajaxSettings.xhr();
					             if(myXhr.upload){ // check if upload property exists
					                 //myXhr.upload.addEventListener('progress',progress_insert_transactions, false); // for handling the progress of the upload
					             }
					             return myXhr;
					         },
					         cache: false,
					         contentType: false,
					         processData: false
					     }).done(function(data){
					         if(data.validacion == 'ok'){
					             $('.cancelaformpedido').click();     
					             queue_load_all('pedidos_list','','listar_pedidos');
					             $('#idor').val(data.id);
					             $('#imprimir_orden').submit();
					             $('.grabaok' ).data('toastr-notification',data.msn);
					             $('.grabaok').click();
					         }else{
					             $('.grabaerror' ).data('toastr-notification',data.msn);
					             $('.grabaerror').click();
					             $('.grabando').addClass('hide');
					             $('.guarda_cliente').removeClass('hide'); 
					         }
					     }); 
					//alert("Updated! Do not forget to do some ajax to sync with backend :)");
			} else {
					
					TablesDataTablesEditor.editRow(oTable, nRow);
					nEditing = nRow;
			}
		});*/

		/*oTable.on('click', 'tr', function (e) {
			e.stopPropagation();
			e.preventDefault();
			var checkbox = $(this).find('input:checkbox');
			checkbox.trigger('click');
			checkbox.is(':checked') ? checkbox.prop('checked', false) : checkbox.prop('checked', true);
		});*/

		/*$('.checkable-group').click(function () {
			var data_target = $(this).data('target');
			if ($(this).is(':checked')) {
				$(data_target).each(function () {
					$(this).prop('checked', true);
					$(this).parents('tr').addClass('selected');
					nSelected++;
				});
			} else {
				$(data_target).each(function () {
					$(this).prop('checked', false);
					$(this).parents('tr').removeClass('selected');
					nSelected--;
				});
			}
			TablesDataTablesEditor.deleteButtonState(nSelected);
		});*/
	},

	init: function () {
		this.editor();

		$.extend( $.fn.dataTable.defaults, {
			fnDrawCallback: function( oSettings ) {
				$('.dataTables_wrapper select, .dataTables_wrapper input').removeClass('input-sm');
			}
		});
	}
}