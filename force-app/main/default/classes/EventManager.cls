public class EventManager {
    // List to store events
    private List<Event> events = new List<Event>();

    // Method to add an event
    public void addEvent(String title, Date eventDate) {
        Event newEvent = new Event(title, eventDate);
        events.add(newEvent);
    }

    // Method to get upcoming events
    public List<Event> getUpcomingEvents() {
        List<Event> upcomingEvents = new List<Event>();
        Date today = Date.today();
        for (Event event : events) {
            if (event.eventDate >= today) {
                upcomingEvents.add(event);
            }
        }
        return upcomingEvents;
    }

    // Inner class to represent an event
    private class Event {
        public String title;
        public Date eventDate;

        public Event(String title, Date eventDate) {
            this.title = title;
            this.eventDate = eventDate;
        }
    }
}