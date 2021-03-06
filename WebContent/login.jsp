<%@include file="./master_header.jsp" %>

<!-- Scripts del login (bootstrap) -->
<!-- https://bootsnipp.com/snippets/z1Bpy -->
<link href=".\bootstrap_login\bootstrap_login.css" rel="stylesheet">
<script src=".\bootstrap_login\bootstrap_login.js"></script>
<!-- /Scripts del login (bootstrap) -->

<!-- Scripts del login (propios) -->
<script type="text/javascript">

	$(document).ready(function(){

		// Cambia el t�tulo de la p�gina
		document.title = "Arroz Tower - Ingreso";

		//Pone en rojo si la contrase�a no tiene m�s de 8 caracteres
		$("#reg-password").focusout(function(){

			if($("#reg-password").val().length<8){
				$("#reg-password").addClass("danger");
				$("#password_warning").css("color","#d9534f");
			}else{
				$("#reg-password").removeClass("danger");
				$("#password_warning").css("color","");
			}
		});

		// Cambio de vista entre registro y login
		$('input[type=radio][name="form_option"]').change(function () {
		    // window.alert($(this).attr('id'));
		    if($(this).attr('id') == "form_option-registro"){
					$("#register-form").toggle();
					$("#login-form").toggle();
					$("#reg-nombre_apellido").focus();
		    }
		    else if($(this).attr('id') == "form_option-login"){
					$("#login-form").toggle();
					$("#register-form").toggle();
					$("#login-email").focus();
				}
		});
	});
</script>
<!-- /Scripts del login (propios) -->




<!-- https://startbootstrap.com/snippets/registration-page/ -->

<div class="container">
	<div class="row">
		<div class="col-lg-6 col-xl-5 mx-auto">
			<div class="card card-signin flex-row my-5">
				<div class="card-body">

					<!-- Header con botones de login/registro -->
					<div class="btn-group btn-group-toggle btn-block" data-toggle="buttons">
						<label class="btn btn-info active">
							<input type="radio" name="form_option" id="form_option-login" autocomplete="off" checked> Ingresar
						</label>
						<label class="btn btn-info">
							<input type="radio" name="form_option" id="form_option-registro" autocomplete="off"> Registrarse
						</label>
					</div>
					<!-- /Header con botones de login/registro -->

					<hr class="my-4">

					<!-- Formulario de ingreso -->
					<form id="login-form" class="cool-form" action="login" method="post" role="form" style="display: block;">

						<!-- Email -->
						<div class="form-label-group">
							<input type="email" name="login-email" id="login-email" tabindex="1" class="form-control" placeholder="E-mail" value="" required autofocus>
						</div>
						<!-- /Email -->

						<!-- Contrase�a -->
						<div class="form-label-group">
							<input type="password" name="login-password" id="login-password" tabindex="2" class="form-control" placeholder="Contrase�a">
						</div>
						<!-- /Contrase�a -->

						<!-- Submit de login -->
						<input type="submit" name="login-submit" id="login-submit" tabindex=3 class="btn btn-lg btn-primary btn-block text-uppercase" value="Ingresar">

						<br/>

						<!-- Olvid� mi contrase�a -->
						<div class="text-center">
							<a href="#" tabindex="5" class="login-forgot_password">Olvid� mi contrase�a</a>
							<!-- Esto se ve m�s adelante cuando sepamos mandar mails -->
						</div>
						<!-- /Olvid� mi contrase�a -->

						<hr class="my-2">

						<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Ingresar con Google</button>
						<button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Ingresar con Facebook</button>
						<!-- /Submit de login -->

					</form>
					<!-- /Formulario de ingreso -->

					<!-- Formulario de registro -->
					<form id="register-form" class="cool-form" action="registro" method="post" role="form" style="display: none;">

						<!-- Datos Personales -->
						<label>Datos personales</label>

						<!-- Nombre -->
						<div class="form-label-group">
							<input type="text" name="reg-nombre" id="reg-nombre" tabindex="1" class="form-control" placeholder="Nombre" value="">
						</div>
						<!-- /Nombre -->

						<!-- Apellido -->
						<div class="form-label-group">
							<input type="text" name="reg-apellido" id="reg-apellido" tabindex="1" class="form-control" placeholder="Apellido" value="">
						</div>
						<!-- /Apellido -->

						<!-- Documento -->
						<div class="form-label-group">
							<input type="number" name="reg-documento" id="reg-documento" tabindex="2" class="form-control" placeholder="N�mero de documento" value="" required>
						</div>
						<!-- /Documento -->

						<!-- Telefono -->
						<div class="form-label-group">
							<input type="number" name="reg-telefono" id="reg-telefono" tabindex="3" class="form-control" placeholder="N�mero de tel�fono" value="" required>
						</div>
						<!-- /Telefono -->

						<!-- /Datos Personales -->

						<hr class="my-4">

						<!-- Datos de residencia -->
						<label>Datos de residencia</label>

						<!-- Pa�s -->
						<div class="form-label-group">
							<select class="form-control" id="reg-pais" name="reg-pais" tabindex="4" required>

								<!-- Opciones de papises -->
								<option value="AF">Afganist�n</option>
								<option value="AL">Albania</option>
								<option value="DE">Alemania</option>
								<option value="AD">Andorra</option>
								<option value="AO">Angola</option>
								<option value="AI">Anguila</option>
								<option value="AG">Antigua y Barbuda</option>
								<option value="AN">Antillas Holandesas</option>
								<option value="AQ">Ant�rtida</option>
								<option value="SA">Arabia Saudita</option>
								<option value="DZ">Argelia</option>
								<option value="AR" selected="">Argentina</option>
								<option value="AM">Armenia</option>
								<option value="AW">Aruba</option>
								<option value="AU">Australia</option>
								<option value="AT">Austria</option>
								<option value="AZ">Azerbaiy�n</option>
								<option value="BS">Bahamas</option>
								<option value="BH">Bahrain</option>
								<option value="BD">Bangladesh</option>
								<option value="BB">Barbados</option>
								<option value="BY">Belar�s</option>
								<option value="BZ">Belice</option>
								<option value="BJ">Benin</option>
								<option value="BM">Bermudas</option>
								<option value="BT">Bhut�n</option>
								<option value="BO">Bolivia</option>
								<option value="BA">Bosnia Herzegovina</option>
								<option value="BW">Botswana</option>
								<option value="BR">Brasil</option>
								<option value="BN">Brunei Darussalam</option>
								<option value="BG">Bulgaria</option>
								<option value="BF">Burkina Faso</option>
								<option value="BI">Burundi</option>
								<option value="BE">B�lgica</option>
								<option value="CV">Cabo Verde</option>
								<option value="KH">Camboya</option>
								<option value="CM">Camer�n</option>
								<option value="CA">Canad�</option>
								<option value="TD">Chad</option>
								<option value="CL">Chile</option>
								<option value="CN">China</option>
								<option value="CY">Chipre</option>
								<option value="VA">Ciudad del Vaticano</option>
								<option value="CO">Colombia</option>
								<option value="KM">Comoras</option>
								<option value="CG">Congo</option>
								<option value="KR">Corea</option>
								<option value="CR">Costa Rica</option>
								<option value="CI">Costa de marfil</option>
								<option value="HR">Croacia</option>
								<option value="CU">Cuba</option>
								<option value="DK">Dinamarca</option>
								<option value="DM">Dominica</option>
								<option value="EC">Ecuador</option>
								<option value="EG">Egipto</option>
								<option value="SV">El Salvador</option>
								<option value="AE">Emiratos �rabes Unidos</option>
								<option value="ER">Eritrea</option>
								<option value="SK">Eslovaquia</option>
								<option value="SI">Eslovenia</option>
								<option value="ES">Espa�a</option>
								<option value="PS">Estado de Palestina</option>
								<option value="US">Estados Unidos de Am�rica</option>
								<option value="EE">Estonia</option>
								<option value="ET">Etiop�a</option>
								<option value="RU">Federaci�n de Rusia</option>
								<option value="FJ">Fiji</option>
								<option value="PH">Filipinas</option>
								<option value="FI">Finlandia</option>
								<option value="FR">Francia</option>
								<option value="GA">Gab�n</option>
								<option value="GM">Gambia</option>
								<option value="GE">Georgia</option>
								<option value="GH">Ghana</option>
								<option value="GI">Gibraltar</option>
								<option value="GB">Gran Breta�a</option>
								<option value="GD">Granada</option>
								<option value="GR">Grecia</option>
								<option value="GL">Groenlandia</option>
								<option value="GP">Guadaloupe</option>
								<option value="GU">Guam</option>
								<option value="GT">Guatemala</option>
								<option value="GF">Guayana Francesa</option>
								<option value="GN">Guinea</option>
								<option value="GQ">Guinea Ecuatorial</option>
								<option value="GW">Guinea-Bissau</option>
								<option value="GY">Guyana</option>
								<option value="HT">Hait�</option>
								<option value="HN">Honduras</option>
								<option value="HK">Hong Kong</option>
								<option value="HU">Hungr�a</option>
								<option value="IN">India</option>
								<option value="ID">Indonesia</option>
								<option value="IQ">Irak</option>
								<option value="IE">Irlanda</option>
								<option value="IR">Ir�n</option>
								<option value="BV">Isla Bouvet</option>
								<option value="NF">Isla Norfolk</option>
								<option value="CX">Isla de Navidad</option>
								<option value="IS">Islandia</option>
								<option value="KY">Islas Caim�n</option>
								<option value="CK">Islas Cook</option>
								<option value="FO">Islas Feroe</option>
								<option value="FK">Islas Malvinas</option>
								<option value="MP">Islas Marianas del Norte</option>
								<option value="MH">Islas Marshall</option>
								<option value="SB">Islas Salom�n</option>
								<option value="TC">Islas Turcas y Caicos</option>
								<option value="VG">Islas V�rgenes Brit�nicas</option>
								<option value="VI">Islas V�rgenes de EE.UU.</option>
								<option value="IL">Israel</option>
								<option value="IT">Italia</option>
								<option value="JM">Jamaica</option>
								<option value="JP">Jap�n</option>
								<option value="JO">Jordania</option>
								<option value="KZ">Kazajst�n</option>
								<option value="KE">Kenia</option>
								<option value="KG">Kirguist�n</option>
								<option value="KI">Kiribati</option>
								<option value="KW">Kuwait</option>
								<option value="LA">Laos</option>
								<option value="LS">Lesotho</option>
								<option value="LV">Letonia</option>
								<option value="LR">Liberia</option>
								<option value="LY">Libia</option>
								<option value="LI">Liechtenstein</option>
								<option value="LT">Lituania</option>
								<option value="LU">Luxemburgo</option>
								<option value="LB">L�bano</option>
								<option value="MO">Macao</option>
								<option value="MK">Macedonia</option>
								<option value="MG">Madagascar</option>
								<option value="MY">Malasia</option>
								<option value="MW">Malawi</option>
								<option value="MV">Maldivas</option>
								<option value="ML">Mali</option>
								<option value="MT">Malta</option>
								<option value="MA">Marruecos</option>
								<option value="MQ">Martinica</option>
								<option value="MU">Mauricio</option>
								<option value="MR">Mauritania</option>
								<option value="YT">Mayotte</option>
								<option value="MX">Mexico</option>
								<option value="MM">Mianmar</option>
								<option value="FM">Micronesia</option>
								<option value="MD">Moldova</option>
								<option value="MN">Mongolia</option>
								<option value="ME">Montenegro</option>
								<option value="MS">Montserrat</option>
								<option value="MZ">Mozambique</option>
								<option value="MC">M�naco</option>
								<option value="NA">Namibia</option>
								<option value="NR">Nauru</option>
								<option value="NP">Nepal</option>
								<option value="NI">Nicaragua</option>
								<option value="NG">Nigeria</option>
								<option value="NU">Niue</option>
								<option value="NO">Noruega</option>
								<option value="NC">Nueva Caledonia</option>
								<option value="NZ">Nueva Zelanda</option>
								<option value="NE">N�ger</option>
								<option value="OM">Om�n</option>
								<option value="PK">Pakist�n</option>
								<option value="PW">Palau</option>
								<option value="PA">Panam�</option>
								<option value="PG">Pap�a Nueva Guinea</option>
								<option value="PY">Paraguay</option>
								<option value="NL">Pa�ses Bajos</option>
								<option value="PE">Per�</option>
								<option value="PN">Pitcairn</option>
								<option value="PF">Polinesia francesa</option>
								<option value="PL">Polonia</option>
								<option value="PT">Portugal</option>
								<option value="PR">Puerto Rico</option>
								<option value="QA">Qatar</option>
								<option value="CF">Rep�blica Centroafricana</option>
								<option value="CZ">Rep�blica Checa</option>
								<option value="DO">Rep�blica Dominicana</option>
								<option value="SY">Rep�blica �rabe Siria</option>
								<option value="RE">Reuni�n</option>
								<option value="RO">Rumania</option>
								<option value="RW">Rwanda</option>
								<option value="WS">Samoa</option>
								<option value="AS">Samoa Americana</option>
								<option value="KN">San Kitts y Nevis</option>
								<option value="SM">San Marino</option>
								<option value="PM">San Pedro y Miquel�n</option>
								<option value="VC">San Vicente y las Granadinas</option>
								<option value="SH">Santa Elena</option>
								<option value="LC">Santa Luc�a</option>
								<option value="ST">Santo Tom� y Pr�ncipe</option>
								<option value="SN">Senegal</option>
								<option value="RS">Serbia</option>
								<option value="SC">Seychelles</option>
								<option value="SL">Sierra Leona</option>
								<option value="SG">Singapur</option>
								<option value="SX">Sint Maarten</option>
								<option value="SO">Somalia</option>
								<option value="LK">Sri Lanka</option>
								<option value="ZA">Sud�frica</option>
								<option value="SD">Sud�n</option>
								<option value="SE">Suecia</option>
								<option value="CH">Suiza</option>
								<option value="SR">Suriname</option>
								<option value="SZ">Swazilandia</option>
								<option value="EH">S�hara Occidental</option>
								<option value="TH">Tailandia</option>
								<option value="TW">Taiwan</option>
								<option value="TZ">Tanzania</option>
								<option value="TJ">Tayikist�n</option>
								<option value="TG">Togo</option>
								<option value="TK">Tokelau</option>
								<option value="TO">Tonga</option>
								<option value="TT">Trinidad y Tobago</option>
								<option value="TM">Turkmenist�n</option>
								<option value="TR">Turqu�a</option>
								<option value="TV">Tuvalu</option>
								<option value="TN">T�nez</option>
								<option value="UA">Ucrania</option>
								<option value="UG">Uganda</option>
								<option value="UY">Uruguay</option>
								<option value="UZ">Uzbekist�n</option>
								<option value="VU">Vanuatu</option>
								<option value="VE">Venezuela</option>
								<option value="VN">Vietnam</option>
								<option value="WF">Wallis y Futuna</option>
								<option value="YE">Yemen</option>
								<option value="DJ">Yibuti</option>
								<option value="ZR">Zaire</option>
								<option value="ZM">Zambia</option>
								<option value="ZW">Zimbabwe</option>
								<!-- /Opciones de pa�ses -->

							</select>
						</div>
						<!-- /Pa�s -->

						<!-- Ciudad -->
						<div class="form-label-group">
							<input type="text" name="reg-ciudad" id="reg-ciudad" tabindex="5" class="form-control" placeholder="Ciudad" value="" required>
						</div>
						<!-- /Ciudad -->

						<!-- C�digo postal -->
						<div class="form-label-group">
							<input type="number" name="reg-cp" id="reg-cp" tabindex="6" class="form-control" placeholder="C�digo postal" value="" required>
						</div>
						<!-- /C�digo postal -->

						<!-- Direcci�n -->
						<div class="form-label-group">
							<input type="text" name="reg-direccion" id="reg-direccion" tabindex="7" class="form-control" placeholder="Direccion de residencia" value="" required>
						</div>
						<!-- /Direcci�n -->

						<!-- /Datos de residencia -->

						<hr class="my-4">

						<!-- Datos de inicio de sesi�n -->
						<label>Datos de inicio de sesi�n</label>

						<!-- Email -->
						<div class="form-label-group">
							<input type="email" name="reg-email" id="reg-email" tabindex="8" class="form-control" placeholder="E-mail" value="" required>
						</div>
						<!-- /Email -->

						<!-- Contrase�a -->
						<div class="form-label-group">
							<input type="password" name="reg-password" id="reg-password" tabindex="9" class="form-control" placeholder="Contrase�a" required pattern=".{8,}">
							<small id="password_help" class="form-text text-muted"><span id="password_warning">Al menos 8 caracteres</span> (may�sculas, min�sculas o n�meros)</small>
						</div>
						<!-- /Contrase�a -->

						<!-- Repetir contrase�a -->
						<div class="form-label-group">
							<input type="password" name="reg-confirm_password" id="reg-confirm_password" tabindex="10" class="form-control" placeholder="Confirmar contrase�a" required pattern=".{8,}">
						</div>
						<!-- /Repetir contrase�a -->

						<!-- /Datos de inicio de sesi�n -->

						<!-- Submit de registro -->
						<input type="submit" name="reg-submit" id="reg-submit" tabindex="11" class="btn btn-lg btn-primary btn-block text-uppercase" value="Registrarse">
						<hr class="my-4">
						<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Registrarse con Google</button>
						<button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Registrarse con Facebook</button>
						<!-- /Submit de registro -->

					</form>
					<!-- Formulario de registro -->
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="./master_footer.jsp" %>
