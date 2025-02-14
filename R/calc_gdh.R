#' Calculate Growing Degree Hours
#'
#' @param data is the dataframe that is output from the 'combine_df' function
#'
#' @return the growing degree hours for the dataframe provided
#'
#' @examples data = temp_df
#' @examples growing_degrees <- calc_gdh(data)
#' @examples print(growing_degrees)
#' @export
calc_gdh <- function(data, field = NULL){
  
  if (!is.null(field)) {
    data %<>% filter(FIELD_ID == field) 
  }
  
  gdhs <- data %>%
    group_by(FIELD_ID, CROP_NAME, CROP_SEASON, Date, Hour) %>%
    filter(Date >= seeding_date & Date <= harvest_date) %>%
    summarize(seeding_date = seeding_date,
              harvest_date = harvest_date,
              gdh = temp_combined_avg - Base_Fahrenheit,
              gdh = case_when(gdh < 0 ~ 0,
                              temp_combined_avg > Upper_Fahrenheit ~ Upper_Fahrenheit - Base_Fahrenheit, 
                              TRUE ~ gdh),
    ) %>%
    rename(GDH_DATE = Date)
  
  write_csv(gdhs, paste0("GDH-", Sys.Date(), ".csv"))
  print("csv file created")
  return(gdhs)
}

