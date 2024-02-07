#' GET Endpoints SB
#'
#' Esta nueva version permite utilizar la V2 del API. Ahora utiliza paginacion para
#' hacer las consultas indicando la cantidad de paginas y de registros a
#' consultar
#'
#' @param api_key Primary Key de la suscripcion.
#' @param end_point Endpoint a consultar. Usa 'end_points()' para ver
#' todas las opciones
#' @param periodo_inicial Fecha en donde incian las series solicitadas
#' @param periodo_final Fecha en donde terminan las series. No obligatoria.
#' @param entidad ID de la entidad a consultar. No se puede introducir al mismo
#' tiempo que 'tipo_entidad'. Usa 'entidades()' para ver todos los IDs.
#' @param tipo_entidad ID del tipo de entidad a consulta. No se puede introducir
#' al mimo tiempo que 'entidad'. Usa 'tipo_entidad()' para ver todas
#' las opciones
#' @param {paginas} {Numero de paginas a consultar. La cantidad de paginas
#' dependera del numero de registros que se consulten.Su valor por defecto es de
#' 1}
#' @param {registros} {Numero de registros a consultar. La cantidad de registros
#' dependera del numero de pagina que se consulten. Su valor por defecto es de
#' 100}
#' @return Dataframe con los datos del endpoint consultado

#' @export
sb_get_v2 <- function(api_key, end_point, periodo_inicial, periodo_final = NULL,
                   entidad = NULL, tipo_entidad = NULL, paginas=1,
                   registros = 100){

  ## Exit cuando entidad y tipo de entidad no sean nulas al mismo tiempo
  if (!is.null(entidad) & !is.null(tipo_entidad)){
    stop("Se introdujo entidad y tipo de entidad al mismo tiempo.")
  }

  ## Exit cuanto periodo inicial es posterior al final
  if (!is.null(periodo_final)){
    if (lubridate::ym(periodo_inicial) > lubridate::ym(periodo_final)){
      stop("Se introdujo un periodo inicial posterior al periodo final.")
    }
  }

  ## Define base_url
  base_url <- "https://apis.sb.gob.do/estadisticas/v2"

  ## Get json
  res <- httr::GET(paste0(base_url, end_point),
                   httr::add_headers("Ocp-Apim-Subscription-Key" = api_key),
                   query = list(
                     periodoInicial = periodo_inicial,
                     periodoFinal = periodo_final,
                     entidad = entidad,
                     tipoEntidad = tipo_entidad,
                     paginas = paginas,
                     registros = registros),
                   encode = "json")

  ## Warning when conection not succeeded
  if (res$status_code != 200){
    stop(paste("Estatus:", res$status_code, ", revisa la consulta!"))
    if (res$status == 500){
      warning(paste("Estatus:", res$status_code, ". Internal Server error.
                    Contactar a 'soporteapis@sb.gob.do'"))
    }
  }

  ## Parse json to df
  df <- httr::content(res, as = "text", encoding = "UTF-8")
  df <- jsonlite::fromJSON(df)

  ## JSON to dataframe
  # df <- as.data.frame(df$data)

  ## Crear notin
  `%notin%` <- Negate(`%in%`)

  if (0 %notin% dim(df)){
    return(df)
  } else{
    stop(paste("No se ha encontrado", end_point, ", revisa la consulta"))
  }

}

df <- sb_get_v2(api_key = "b0f966428bde45dc913ffd59d88b9dc0",
             end_point = "/estados/resultados/eif",
             periodo_inicial = "2023-01",
             tipo_entidad = "BM")
