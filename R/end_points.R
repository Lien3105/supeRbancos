#' Print de todos los endpoint del API
#' @export
end_points <- function(){
  cat("
  **Endpoints**\n
  Captaciones:\n
  Captaciones por localidad:'captaciones/localidad'\n
  Captaciones por moneda:'captaciones/moneda'\n
  Captaciones por sector y tipo depositante: 'captaciones/sector-depositante'\n
  Cartera:\n
  Cartera de créditos por clasificación de riesgo:'carteras/creditos/clasificacion-riesgo'\n
  Cartera de créditos por genero:'carteras/creditos/genero'\n
  Cartera de créditos por localidad:'carteras/creditos/localidad'\n
  Cartera de créditos por moneda:'carteras/creditos/moneda'\n
  Cartera de créditos por sectores económicos:'carteras/creditos/sectores-economicos'\n
  Cartera de créditos por tipo:'carteras/creditos/tipo'\n
  Cartera de créditos por tipo de facilidad:'carteras/creditos/facilidad'\n
  Cartera de inversiones:'carteras/creditos/inversiones'\n
  Cifras de acceso:\n
  Cifras de acceso:'detalle-entidades/acceso'\n
  Detalles Entidades:\n
  Estado de resultados de Entidades de Intermediación Cambiaria (EIC):'estados/resultados/eic'\n
  Estado de resultados de Entidades de Intermediación Financiera (EIF):'estados/resultados/eif'\n
  Estado de situación de Entidades de Intermediación Cambiaria (EIC):'estados/situacion/eic'\n
  Estado de situación de Entidades de Intermediación Financiera (EIF):'estados/situacion/eif'\n
  Indicadores:\n
  Indicador de morosidad estresada:'indicadores/morosidad-estresada'\n
  Indicadores de riesgo de crédito:'indicadores/riesgo-credito'\n
  Indicadores financieros:'indicadores/financieros'\n
  Principales indicadores del sistema:'indicadores/principales'\n
  Reclamaciones:\n
  Reclamaciones de Entidades de Intermediación Financiera (EIF):'reclamaciones/eif'\n
  Reclamaciones de ProUsuario:'reclamaciones/prousuario'\n
  SolvenciaComponentes:\n
  Solvencia:'solvencia/componentes'\n
  SubagentesBancarios:\n
  Operaciones de Subagentes bancarios:'subagentes/operaciones'\n
  Sucursales de Subagentes bancarios por localidad y actividad económica:'subagentes/actividad-economica'\n
  Total de Subagentes bancarios:'subagentes/total'\n
  TasasComisiones:\n
  Tasas y comisiones de Tarjetas de crédito:'tasas-comisiones/tarjetas-credito'\n
  ")
  }
