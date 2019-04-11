<%@include file=".\master_header.jsp" %>


<!-- Scripts del login (bootstrap) -->
<!-- https://bootsnipp.com/snippets/z1Bpy -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href=".\bootstrap_login\bootstrap_login.css" rel="stylesheet">
<script src=".\bootstrap_login\bootstrap_login.js"></script>
<!-- /Scripts del login (bootstrap) -->

<!-- Scripts del login (propios) -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var alert = "<%= ((String)request.getAttribute("alert")) %>"

		if(alert != "null"){
			window.alert(alert);
		}
		//Pone en rojo si la contraseña no tiene más de 8 caracteres
		$("#reg-password").focusout(function(){

			if($("#reg-password").val().length<8){
				$("#reg-password").addClass("danger");
				$("#password_warning").css("color","#d9534f");
			}else{
				$("#reg-password").removeClass("danger");
				$("#password_warning").css("color","");
			}
		});
	});
</script>
<!-- /Scripts del login (propios) -->

<!-- Contenedor para login y registro -->
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">

				<!-- Panel header -->
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="login-form-link">Ingresar</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link">Registrarse</a>
						</div>
					</div>
					<hr>
				</div>
				<!-- /Panel header -->

				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">

							<!-- Formualario de login -->
							<form id="login-form" action="/tp_java/login" method="post" role="form" style="display: block;">

								<!-- Email -->
								<div class="form-group">
									<input type="email" name="login-email" id="email" tabindex="1" class="form-control" placeholder="E-mail" value="" autofocus required>
								</div>
								<!-- /Email -->
								
								<!-- Contraseña -->
								<div class="form-group">
									<input type="password" name="login-password" id="password" tabindex="2" class="form-control" placeholder="Contraseña" required>
								</div>
								<!-- /Contraseña -->
								
								<!-- Recordarme -->
								<div class="form-group text-center">
									<input type="checkbox" tabindex="3" class="" name="login-remember" id="login-remember">
									<label for="remember"> Recordarme</label>
									<!-- Yo no tengo idea de cómo hacer que te recuerde el user -->
								</div>
								<!-- /Recordarme -->
								
								<!-- Submit de login -->
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="ingresar">
										</div>
									</div>
								</div>
								<!-- /Submit de login -->
								
								<!-- Olvidé mi contraseña -->
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="#" tabindex="5" class="login-forgot_password">Olvidé mi contraseña</a>
												<!-- Esto se ve más adelante cuando sepamos mandar mails -->
											</div>
										</div>
									</div>
								</div>
								<!-- /Olvidé mi contraseña -->
							
							</form>
							<!-- /Formualario de login -->

							<!-- Formualario de registro -->
							<form id="register-form" action="" method="post" role="form" style="display: none;">
								
								<!-- Datos Personales -->
								<label>Datos personales</label>
								
								<!-- Nombre y apellido -->
								<div class="form-group">
									<input type="text" name="reg-nombre_apellido" id="reg-nombre_apellido" tabindex="1" class="form-control" placeholder="Nombre y apellido" value="" required>
								</div>
								<!-- /Nombre y apellido -->

								<!-- Documento -->
								<div class="form-group">
									<input type="text" name="reg-documento" id="reg-documento" tabindex="2" class="form-control" placeholder="Número de documento" value="" required>
								</div>
								<!-- /Documento -->
								
								<!-- Telefono -->
								<div class="form-group">
									<input type="number" name="reg-telefono" id="reg-telefono" tabindex="3" class="form-control" placeholder="Número de teléfono" value="" required>
								</div>
								<!-- /Telefono -->

								<!-- /Datos Personales -->

								<!-- Datos de residencia -->
								<label>Datos de residencia</label>

								<!-- País -->
								<div class="form-group">
									<select class="form-control" id="reg-pais" name="reg-pais" tabindex="4" required>
										
										<!-- Opciones de países -->
										<option value="AF">Afganistán</option>
										<option value="AL">Albania</option>
										<option value="DE">Alemania</option>
										<option value="AD">Andorra</option>
										<option value="AO">Angola</option>
										<option value="AI">Anguila</option>
										<option value="AG">Antigua y Barbuda</option>
										<option value="AN">Antillas Holandesas</option>
										<option value="AQ">Antártida</option>
										<option value="SA">Arabia Saudita</option>
										<option value="DZ">Argelia</option>
										<option value="AR" selected="">Argentina</option>
										<option value="AM">Armenia</option>
										<option value="AW">Aruba</option>
										<option value="AU">Australia</option>
										<option value="AT">Austria</option>
										<option value="AZ">Azerbaiyán</option>
										<option value="BS">Bahamas</option>
										<option value="BH">Bahrain</option>
										<option value="BD">Bangladesh</option>
										<option value="BB">Barbados</option>
										<option value="BY">Belarús</option>
										<option value="BZ">Belice</option>
										<option value="BJ">Benin</option>
										<option value="BM">Bermudas</option>
										<option value="BT">Bhután</option>
										<option value="BO">Bolivia</option>
										<option value="BA">Bosnia Herzegovina</option>
										<option value="BW">Botswana</option>
										<option value="BR">Brasil</option>
										<option value="BN">Brunei Darussalam</option>
										<option value="BG">Bulgaria</option>
										<option value="BF">Burkina Faso</option>
										<option value="BI">Burundi</option>
										<option value="BE">Bélgica</option>
										<option value="CV">Cabo Verde</option>
										<option value="KH">Camboya</option>
										<option value="CM">Camerún</option>
										<option value="CA">Canadá</option>
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
										<option value="AE">Emiratos Árabes Unidos</option>
										<option value="ER">Eritrea</option>
										<option value="SK">Eslovaquia</option>
										<option value="SI">Eslovenia</option>
										<option value="ES">España</option>
										<option value="PS">Estado de Palestina</option>
										<option value="US">Estados Unidos de América</option>
										<option value="EE">Estonia</option>
										<option value="ET">Etiopía</option>
										<option value="RU">Federación de Rusia</option>
										<option value="FJ">Fiji</option>
										<option value="PH">Filipinas</option>
										<option value="FI">Finlandia</option>
										<option value="FR">Francia</option>
										<option value="GA">Gabón</option>
										<option value="GM">Gambia</option>
										<option value="GE">Georgia</option>
										<option value="GH">Ghana</option>
										<option value="GI">Gibraltar</option>
										<option value="GB">Gran Bretaña</option>
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
										<option value="HT">Haití</option>
										<option value="HN">Honduras</option>
										<option value="HK">Hong Kong</option>
										<option value="HU">Hungría</option>
										<option value="IN">India</option>
										<option value="ID">Indonesia</option>
										<option value="IQ">Irak</option>
										<option value="IE">Irlanda</option>
										<option value="IR">Irán</option>
										<option value="BV">Isla Bouvet</option>
										<option value="NF">Isla Norfolk</option>
										<option value="CX">Isla de Navidad</option>
										<option value="IS">Islandia</option>
										<option value="KY">Islas Caimán</option>
										<option value="CK">Islas Cook</option>
										<option value="FO">Islas Feroe</option>
										<option value="FK">Islas Malvinas</option>
										<option value="MP">Islas Marianas del Norte</option>
										<option value="MH">Islas Marshall</option>
										<option value="SB">Islas Salomón</option>
										<option value="TC">Islas Turcas y Caicos</option>
										<option value="VG">Islas Vírgenes Británicas</option>
										<option value="VI">Islas Vírgenes de EE.UU.</option>
										<option value="IL">Israel</option>
										<option value="IT">Italia</option>
										<option value="JM">Jamaica</option>
										<option value="JP">Japón</option>
										<option value="JO">Jordania</option>
										<option value="KZ">Kazajstán</option>
										<option value="KE">Kenia</option>
										<option value="KG">Kirguistán</option>
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
										<option value="LB">Líbano</option>
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
										<option value="MC">Mónaco</option>
										<option value="NA">Namibia</option>
										<option value="NR">Nauru</option>
										<option value="NP">Nepal</option>
										<option value="NI">Nicaragua</option>
										<option value="NG">Nigeria</option>
										<option value="NU">Niue</option>
										<option value="NO">Noruega</option>
										<option value="NC">Nueva Caledonia</option>
										<option value="NZ">Nueva Zelanda</option>
										<option value="NE">Níger</option>
										<option value="OM">Omán</option>
										<option value="PK">Pakistán</option>
										<option value="PW">Palau</option>
										<option value="PA">Panamá</option>
										<option value="PG">Papúa Nueva Guinea</option>
										<option value="PY">Paraguay</option>
										<option value="NL">Países Bajos</option>
										<option value="PE">Perú</option>
										<option value="PN">Pitcairn</option>
										<option value="PF">Polinesia francesa</option>
										<option value="PL">Polonia</option>
										<option value="PT">Portugal</option>
										<option value="PR">Puerto Rico</option>
										<option value="QA">Qatar</option>
										<option value="CF">República Centroafricana</option>
										<option value="CZ">República Checa</option>
										<option value="DO">República Dominicana</option>
										<option value="SY">República Árabe Siria</option>
										<option value="RE">Reunión</option>
										<option value="RO">Rumania</option>
										<option value="RW">Rwanda</option>
										<option value="WS">Samoa</option>
										<option value="AS">Samoa Americana</option>
										<option value="KN">San Kitts y Nevis</option>
										<option value="SM">San Marino</option>
										<option value="PM">San Pedro y Miquelón</option>
										<option value="VC">San Vicente y las Granadinas</option>
										<option value="SH">Santa Elena</option>
										<option value="LC">Santa Lucía</option>
										<option value="ST">Santo Tomé y Príncipe</option>
										<option value="SN">Senegal</option>
										<option value="RS">Serbia</option>
										<option value="SC">Seychelles</option>
										<option value="SL">Sierra Leona</option>
										<option value="SG">Singapur</option>
										<option value="SX">Sint Maarten</option>
										<option value="SO">Somalia</option>
										<option value="LK">Sri Lanka</option>
										<option value="ZA">Sudáfrica</option>
										<option value="SD">Sudán</option>
										<option value="SE">Suecia</option>
										<option value="CH">Suiza</option>
										<option value="SR">Suriname</option>
										<option value="SZ">Swazilandia</option>
										<option value="EH">Sáhara Occidental</option>
										<option value="TH">Tailandia</option>
										<option value="TW">Taiwan</option>
										<option value="TZ">Tanzania</option>
										<option value="TJ">Tayikistán</option>
										<option value="TG">Togo</option>
										<option value="TK">Tokelau</option>
										<option value="TO">Tonga</option>
										<option value="TT">Trinidad y Tobago</option>
										<option value="TM">Turkmenistán</option>
										<option value="TR">Turquía</option>
										<option value="TV">Tuvalu</option>
										<option value="TN">Túnez</option>
										<option value="UA">Ucrania</option>
										<option value="UG">Uganda</option>
										<option value="UY">Uruguay</option>
										<option value="UZ">Uzbekistán</option>
										<option value="VU">Vanuatu</option>
										<option value="VE">Venezuela</option>
										<option value="VN">Vietnam</option>
										<option value="WF">Wallis y Futuna</option>
										<option value="YE">Yemen</option>
										<option value="DJ">Yibuti</option>
										<option value="ZR">Zaire</option>
										<option value="ZM">Zambia</option>
										<option value="ZW">Zimbabwe</option>
										<!-- /Opciones de países -->

									</select>
								</div>
								<!-- /País -->

								<!-- Ciudad -->
								<div class="form-group">
									<input type="text" name="reg-ciudad" id="reg-ciudad" tabindex="5" class="form-control" placeholder="Ciudad" value="" required>
								</div>
								<!-- /Ciudad -->

								<!-- Código postal -->
								<div class="form-group">
									<input type="text" name="reg-cp" id="reg-cp" tabindex="6" class="form-control" placeholder="Código postal" value="" required>
								</div>
								<!-- /Código postal -->

								<!-- Dirección -->
								<div class="form-group">
									<input type="text" name="reg-direccion" id="reg-direccion" tabindex="7" class="form-control" placeholder="Direccion de residencia" value="" required>
								</div>
								<!-- /Dirección -->

								<!-- /Datos de residencia -->

								<!-- Datos de inicio de sesión -->
								<label>Datos de inicio de sesión</label>

								<!-- Email -->
								<div class="form-group">
									<input type="email" name="reg-email" id="reg-email" tabindex="8" class="form-control" placeholder="E-mail" value="" required>
								</div>
								<!-- /Email -->

								<!-- Contraseña -->
								<div class="form-group">
									<input type="password" name="reg-password" id="reg-password" tabindex="9" class="form-control" placeholder="Contraseña" required pattern=".{8,}">
									<small id="password_help" class="form-text text-muted"><span id="password_warning">Al menos 8 caracteres</span> (mayúsculas, minúsculas o números)</small>
								</div>
								<!-- /Contraseña -->

								<!-- Repetir contraseña -->
								<div class="form-group">
									<input type="password" name="reg-confirm_password" id="reg-confirm_password" tabindex="10" class="form-control" placeholder="Confirmar contraseña" required pattern=".{8,}">
								</div>
								<!-- /Repetir contraseña -->

								<!-- Submit de registro -->
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="reg-submit" id="reg-submit" tabindex="11" class="form-control btn btn-register" value="Registrarse">
										</div>
									</div>
								</div>
								<!-- /Submit de registro -->

								<!-- /Datos de inicio de sesión -->

							</form>
							<!-- Formulario de registro -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /Contenedor para login y registro -->


<%@include file=".\master_footer.jsp" %>