
endpoints <- c('captaciones/localidad', 'captaciones/moneda', 'captaciones/sector-depositante', 'carteras/creditos/clasificacion-riesgo', 'carteras/creditos/genero', 'carteras/creditos/localidad','carteras/creditos/moneda','carteras/creditos/sectores-economicos',
               'carteras/creditos/tipo', 'carteras/creditos/facilidad', 'carteras/creditos/inversiones', 'detalle-entidades/acceso', 'estados/resultados/eic','estados/resultados/eif','estados/situacion/eic', 'estados/situacion/eif',
               'indicadores/morosidad-estresada', 'indicadores/riesgo-credito', 'indicadores/financieros', 'indicadores/principales', 'reclamaciones/eif', 'reclamaciones/prousuario', 'solvencia/componentes','subagentes/operaciones',
               'subagentes/actividad-economica', 'subagentes/total', 'tasas-comisiones/tarjetas-credito')

for (i in endpoints){

  test_that("get works with no periodoFinal nor entidad", {
    expect_s3_class(sb_get_v2(api_key = "b0f966428bde45dc913ffd59d88b9dc0",
                              end_point = i, periodo_inicial = "2023",
                              tipo_entidad = "BM", paginas=1,
                              registros = 1), "data.frame")
  })
  # test_that("get works with no entidad", {
  #   expect_s3_class(sb_get(api_key = "b0f966428bde45dc913ffd59d88b9dc0",
  #                          end_point = i,
  #                          periodo_inicial = "2022-01", periodo_final = "2022-02",
  #                          tipo_entidad =  "BM"), "data.frame")
  # })
  #
  # test_that("get works with no tipoEntidad", {
  #   expect_s3_class(sb_get(api_key = "b0f966428bde45dc913ffd59d88b9dc0",
  #                          end_point = i,
  #                          periodo_inicial = "2022-01", periodo_final = "2022-02",
  #                          entidad = "ACTIVO"), "data.frame")
  # })
}
