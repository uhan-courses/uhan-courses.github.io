function toggleOlderAnnouncements() {
  $(".old-announcement").fadeToggle();
  txt = $("#toggle-announcements").text();
  if (txt == "Show older announcements") {
    $("#toggle-announcements").text("Hide older announcements");
  } else {
    $("#toggle-announcements").text("Show older announcements");
  }
}

function toggleOlderSchedules() {
  $(".old-schedule").fadeToggle();
  txt = $("#toggle-schedule").text();
  if (txt == "Show past days") {
    $("#toggle-schedule").text("Hide past days");
  } else {
    $("#toggle-schedule").text("Show past days");
  }
}
