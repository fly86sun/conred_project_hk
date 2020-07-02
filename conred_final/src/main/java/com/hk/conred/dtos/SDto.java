package com.hk.conred.dtos;
 
public class SDto {
	private int store_seq;
	private String owner_id;
	private String store_name;
	private String store_owner_name;
	private String store_path;
	private String store_intro_simple;
	private String store_intro;
	private String store_state;
	private String store_phone;
	private String store_phone_manager;
	private String store_address;
	private String store_address_detail;
	private String store_time_other;
	private String store_bank;
	private String store_account;
	private String store_license_number;
	private String store_license_biz_origin;
	private String store_license_biz_stored;
	private String store_license_biz_size;
	private String store_license_sales_origin;
	private String store_license_sales_stored;
	private String store_license_sales_size;
	private String store_owner_phone;
	private String store_agreement;
	private String store_admin_state;
	private int store_maxdate;
	private int store_maxman;
	private CDto cDto;
	private InterestsDto iDto;
	private SPhotoDto spDto;
	private double clean_avg;
	private double service_avg;
	private double price_avg;
	private double all_avg;
	
	private String category_code;
	private String category_name;
	private String store_photo_stored;
	
	private String store_latitude;
	private String store_longitude;
//	private SLocaDto slocadto;



	public SDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getStore_photo_stored() {
		return store_photo_stored;
	}
	
	
	
	public void setStore_photo_stored(String store_photo_stored) {
		this.store_photo_stored = store_photo_stored;
	}
	
	
	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



	public double getClean_avg() {
		return clean_avg;
	}



	public void setClean_avg(double clean_avg) {
		this.clean_avg = clean_avg;
	}



	public double getService_avg() {
		return service_avg;
	}



	public void setService_avg(double service_avg) {
		this.service_avg = service_avg;
	}



	public double getPrice_avg() {
		return price_avg;
	}



	public void setPrice_avg(double price_avg) {
		this.price_avg = price_avg;
	}



	public double getAll_avg() {
		return all_avg;
	}



	public void setAll_avg(double all_avg) {
		this.all_avg = all_avg;
	}



	public SDto(int store_seq, double clean_avg, double service_avg, double price_avg, double all_avg) {
		super();
		this.store_seq = store_seq;
		this.clean_avg = clean_avg;
		this.service_avg = service_avg;
		this.price_avg = price_avg;
		this.all_avg = all_avg;
	}



	public SDto(int store_seq, String owner_id, String store_name, String store_owner_name, String store_path,
			String store_intro_simple, String store_intro, String store_state, String store_phone,
			String store_phone_manager, String store_address, String store_address_detail, String store_time_other,
			String store_bank, String store_account, String store_license_number, String store_license_biz_origin,
			String store_license_biz_stored, String store_license_biz_size, String store_license_sales_origin,
			String store_license_sales_stored, String store_license_sales_size, String store_owner_phone,
			String store_agreement, String store_admin_state, int store_maxdate, int store_maxman) {
		super();
		this.store_seq = store_seq;
		this.owner_id = owner_id;
		this.store_name = store_name;
		this.store_owner_name = store_owner_name;
		this.store_path = store_path;
		this.store_intro_simple = store_intro_simple;
		this.store_intro = store_intro;
		this.store_state = store_state;
		this.store_phone = store_phone;
		this.store_phone_manager = store_phone_manager;
		this.store_address = store_address;
		this.store_address_detail = store_address_detail;
		this.store_time_other = store_time_other;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.store_license_number = store_license_number;
		this.store_license_biz_origin = store_license_biz_origin;
		this.store_license_biz_stored = store_license_biz_stored;
		this.store_license_biz_size = store_license_biz_size;
		this.store_license_sales_origin = store_license_sales_origin;
		this.store_license_sales_stored = store_license_sales_stored;
		this.store_license_sales_size = store_license_sales_size;
		this.store_owner_phone = store_owner_phone;
		this.store_agreement = store_agreement;
		this.store_admin_state = store_admin_state;
		this.store_maxdate = store_maxdate;
		this.store_maxman = store_maxman;
	}




	//점포등록1 : certify insert 용
	public SDto(String owner_id, String store_owner_name, String store_license_number, String store_license_biz_origin,
			String store_license_biz_stored, String store_license_biz_size, String store_license_sales_origin,
			String store_license_sales_stored, String store_license_sales_size, String store_owner_phone,
			String store_agreement) {
		super();
		this.owner_id = owner_id;
		this.store_owner_name = store_owner_name;
		this.store_license_number = store_license_number;
		this.store_license_biz_origin = store_license_biz_origin;
		this.store_license_biz_stored = store_license_biz_stored;
		this.store_license_biz_size = store_license_biz_size;
		this.store_license_sales_origin = store_license_sales_origin;
		this.store_license_sales_stored = store_license_sales_stored;
		this.store_license_sales_size = store_license_sales_size;
		this.store_owner_phone = store_owner_phone;
		this.store_agreement = store_agreement;
	}

//	public SDto(int store_seq, String category_code) {
//		super();
//		this.store_seq = store_seq;
//		this.category_code = category_code;
//	}

	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_owner_name() {
		return store_owner_name;
	}
	public void setStore_owner_name(String store_owner_name) {
		this.store_owner_name = store_owner_name;
	}
	public String getStore_path() {
		return store_path;
	}
	public void setStore_path(String store_path) {
		this.store_path = store_path;
	}
	public String getStore_intro_simple() {
		return store_intro_simple;
	}
	public void setStore_intro_simple(String store_intro_simple) {
		this.store_intro_simple = store_intro_simple;
	}
	public String getStore_intro() {
		return store_intro;
	}
	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}
	public String getStore_state() {
		return store_state;
	}
	public void setStore_state(String store_state) {
		this.store_state = store_state;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
	public String getStore_phone_manager() {
		return store_phone_manager;
	}
	public void setStore_phone_manager(String store_phone_manager) {
		this.store_phone_manager = store_phone_manager;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_address_detail() {
		return store_address_detail;
	}
	public void setStore_address_detail(String store_address_detail) {
		this.store_address_detail = store_address_detail;
	}
	public String getStore_time_other() {
		return store_time_other;
	}
	public void setStore_time_other(String store_time_other) {
		this.store_time_other = store_time_other;
	}
	public String getStore_bank() {
		return store_bank;
	}
	public void setStore_bank(String store_bank) {
		this.store_bank = store_bank;
	}
	public String getStore_account() {
		return store_account;
	}
	public void setStore_account(String store_account) {
		this.store_account = store_account;
	}
	public String getStore_license_number() {
		return store_license_number;
	}
	public void setStore_license_number(String store_license_number) {
		this.store_license_number = store_license_number;
	}
	public String getStore_license_biz_origin() {
		return store_license_biz_origin;
	}
	public void setStore_license_biz_origin(String store_license_biz_origin) {
		this.store_license_biz_origin = store_license_biz_origin;
	}
	public String getStore_license_biz_stored() {
		return store_license_biz_stored;
	}
	public void setStore_license_biz_stored(String store_license_biz_stored) {
		this.store_license_biz_stored = store_license_biz_stored;
	}
	public String getStore_license_biz_size() {
		return store_license_biz_size;
	}
	public void setStore_license_biz_size(String store_license_biz_size) {
		this.store_license_biz_size = store_license_biz_size;
	}
	public String getStore_license_sales_origin() {
		return store_license_sales_origin;
	}
	public void setStore_license_sales_origin(String store_license_sales_origin) {
		this.store_license_sales_origin = store_license_sales_origin;
	}
	public String getStore_license_sales_stored() {
		return store_license_sales_stored;
	}
	public void setStore_license_sales_stored(String store_license_sales_stored) {
		this.store_license_sales_stored = store_license_sales_stored;
	}
	public String getStore_license_sales_size() {
		return store_license_sales_size;
	}
	public void setStore_license_sales_size(String store_license_sales_size) {
		this.store_license_sales_size = store_license_sales_size;
	}
	public String getStore_owner_phone() {
		return store_owner_phone;
	}
	public void setStore_owner_phone(String store_owner_phone) {
		this.store_owner_phone = store_owner_phone;
	}
	public String getStore_agreement() {
		return store_agreement;
	}
	public void setStore_agreement(String store_agreement) {
		this.store_agreement = store_agreement;
	}
	public String getStore_admin_state() {
		return store_admin_state;
	}
	public void setStore_admin_state(String store_admin_state) {
		this.store_admin_state = store_admin_state;
	}
	public int getStore_maxdate() {
		return store_maxdate;
	}
	public void setStore_maxdate(int store_maxdate) {
		this.store_maxdate = store_maxdate;
	}
	public int getStore_maxman() {
		return store_maxman;
	}
	public void setStore_maxman(int store_maxman) {
		this.store_maxman = store_maxman;
	}
	
	public CDto getcDto() {
		return cDto;
	}

	public void setcDto(CDto cDto) {
		this.cDto = cDto;
	}
 
	public InterestsDto getiDto() {
		return iDto;
	}

	public void setiDto(InterestsDto iDto) {
		this.iDto = iDto;
	}
	
	public SPhotoDto getSpDto() {
		return spDto;
	}
	
	public void setSpDto(SPhotoDto spDto) {
		this.spDto = spDto;
	}
	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	@Override
	public String toString() {
		return "SDto [store_seq=" + store_seq + ", owner_id=" + owner_id + ", store_name=" + store_name
				+ ", store_owner_name=" + store_owner_name + ", store_path=" + store_path + ", store_intro_simple="
				+ store_intro_simple + ", store_intro=" + store_intro + ", store_state=" + store_state
				+ ", store_phone=" + store_phone + ", store_phone_manager=" + store_phone_manager + ", store_address="
				+ store_address + ", store_address_detail=" + store_address_detail + ", store_time_other="
				+ store_time_other + ", store_bank=" + store_bank + ", store_account=" + store_account
				+ ", store_license_number=" + store_license_number + ", store_license_biz_origin="
				+ store_license_biz_origin + ", store_license_biz_stored=" + store_license_biz_stored
				+ ", store_license_biz_size=" + store_license_biz_size + ", store_license_sales_origin="
				+ store_license_sales_origin + ", store_license_sales_stored=" + store_license_sales_stored
				+ ", store_license_sales_size=" + store_license_sales_size + ", store_owner_phone=" + store_owner_phone
				+ ", store_agreement=" + store_agreement + ", store_admin_state=" + store_admin_state
				+ ", store_maxdate=" + store_maxdate + ", store_maxman=" + store_maxman + ", cDto=" + cDto + ", iDto="
				+ iDto + ", spDto=" + spDto + ", clean_avg=" + clean_avg + ", service_avg=" + service_avg
				+ ", price_avg=" + price_avg + ", all_avg=" + all_avg + ", category_code=" + category_code
				+ ", category_name=" + category_name + ", store_photo_stored=" + store_photo_stored
				+ ", store_latitude=" + store_latitude + ", store_longitude=" + store_longitude + "]";
	}

	public String getStore_latitude() {
		return store_latitude;
	}

	public void setStore_latitude(String store_latitude) {
		this.store_latitude = store_latitude;
	}

	public String getStore_longitude() {
		return store_longitude;
	}

	public void setStore_longitude(String store_longitude) {
		this.store_longitude = store_longitude;
	}



//	public SLocaDto getSlocadto() {
//		return slocadto;
//	}
//
//	public void setSlocadto(SLocaDto slocadto) {
//		this.slocadto = slocadto;
//	}


	
//	@Override
//	public String toString() {
//		return "SDto [store_seq=" + store_seq + ", owner_id=" + owner_id + ", store_name=" + store_name
//				+ ", store_owner_name=" + store_owner_name + ", store_path=" + store_path + ", store_intro_simple="
//				+ store_intro_simple + ", store_intro=" + store_intro + ", store_state=" + store_state
//				+ ", store_phone=" + store_phone + ", store_phone_manager=" + store_phone_manager + ", store_address="
//				+ store_address + ", store_address_detail=" + store_address_detail + ", store_time_other="
//				+ store_time_other + ", store_bank=" + store_bank + ", store_account=" + store_account
//				+ ", store_license_number=" + store_license_number + ", store_license_biz_origin="
//				+ store_license_biz_origin + ", store_license_biz_stored=" + store_license_biz_stored
//				+ ", store_license_biz_size=" + store_license_biz_size + ", store_license_sales_origin="
//				+ store_license_sales_origin + ", store_license_sales_stored=" + store_license_sales_stored
//				+ ", store_license_sales_size=" + store_license_sales_size + ", store_owner_phone=" + store_owner_phone
//				+ ", store_agreement=" + store_agreement + ", store_admin_state=" + store_admin_state
//				+ ", store_maxdate=" + store_maxdate + ", store_maxman=" + store_maxman + ", cDto=" + cDto + ", iDto="
//				+ iDto + ", spDto=" + spDto + ", clean_avg=" + clean_avg + ", service_avg=" + service_avg
//				+ ", price_avg=" + price_avg + ", all_avg=" + all_avg + ", category_code=" + category_code
//				+ ", category_name=" + category_name + ", store_photo_stored=" + store_photo_stored + "]";
//	}






	
//	@Override
//	public String toString() {
//		return "SDto [store_seq=" + store_seq + ", owner_id=" + owner_id + ", store_name=" + store_name
//				+ ", store_owner_name=" + store_owner_name + ", store_path=" + store_path + ", store_intro_simple="
//				+ store_intro_simple + ", store_intro=" + store_intro + ", store_state=" + store_state
//				+ ", store_phone=" + store_phone + ", store_phone_manager=" + store_phone_manager + ", store_address="
//				+ store_address + ", store_address_detail=" + store_address_detail + ", store_time_other="
//				+ store_time_other + ", store_bank=" + store_bank + ", store_account=" + store_account
//				+ ", store_license_number=" + store_license_number + ", store_license_biz_origin="
//				+ store_license_biz_origin + ", store_license_biz_stored=" + store_license_biz_stored
//				+ ", store_license_biz_size=" + store_license_biz_size + ", store_license_sales_origin="
//				+ store_license_sales_origin + ", store_license_sales_stored=" + store_license_sales_stored
//				+ ", store_license_sales_size=" + store_license_sales_size + ", store_owner_phone=" + store_owner_phone
//				+ ", store_agreement=" + store_agreement + ", store_admin_state=" + store_admin_state
//				+ ", store_maxdate=" + store_maxdate + ", store_maxman=" + store_maxman + "]";
//	}
	
	
}
