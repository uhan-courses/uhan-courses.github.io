function toggleOlderAnnouncements() {
  $(".old-announcement").fadeToggle();
  txt = $("#toggle-announcements").text();
  if (txt == "Show older announcements") {
    $("#toggle-announcements").text("Hide older announcements");
  } else {
    $("#toggle-announcements").text("Show older announcements");
  }
}
