package mainPackage;

public class Schedule {
	private Boolean [] monday;
	private Boolean [] tuesday;
	private Boolean [] wednesday;
	private Boolean [] thursday;
	private Boolean [] friday;
	
	public Schedule(Boolean[] monday, Boolean[] tuesday,Boolean[] wednesday,Boolean[] thursday,Boolean[] friday) {
		this.monday = monday;
		this.tuesday = tuesday;
		this.wednesday = wednesday;
		this.thursday = thursday;
		this.friday = friday;
	}

	public Boolean[] getMonday() {
		return monday;
	}

	public void setMonday(Boolean[] monday) {
		this.monday = monday;
	}

	public Boolean[] getTuesday() {
		return tuesday;
	}

	public void setTuesday(Boolean[] tuesday) {
		this.tuesday = tuesday;
	}

	public Boolean[] getWednesday() {
		return wednesday;
	}

	public void setWednesday(Boolean[] wednesday) {
		this.wednesday = wednesday;
	}

	public Boolean[] getThursday() {
		return thursday;
	}

	public void setThursday(Boolean[] thursday) {
		this.thursday = thursday;
	}

	public Boolean[] getFriday() {
		return friday;
	}

	public void setFriday(Boolean[] friday) {
		this.friday = friday;
	}
	
	
}
