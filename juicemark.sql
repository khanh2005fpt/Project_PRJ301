create database juicemark;
use juicemark;

create table Admin(
	userID int IDENTITY(1,1) Primary key,
	name nvarchar(MAX),
	email nvarchar(MAX), 
	username nvarchar(MAX),
	password nvarchar(MAX),
	admin bit,
	oid int,
);



drop table admin
SET IDENTITY_INSERT Admin ON 
SET IDENTITY_INSERT Admin OFF
insert into Admin
	(name, userID, email, username, password, admin) values
	(N'Nguyễn Hữu Bảo Khánh', 1, 'nguyenhuubaokhanh2005@gmail.com', 'khanh2005fpt', '123', 1),
	(N'Nguyễn Hữu Bảo', 2, 'nguyenhuubaokhang2005@gmail.com', 'khanh2006fpt', '12345', 0),
	(N'Nguyễn Hữu Khánh', 3, 'nguyenhuubaokhanh2006@gmail.com', 'khanh2007fpt', '1234', 0)
	select * from Admin;

create table OrderLine(
	oid int Primary Key,
	pid int not null,
	quantity int not null,
	price int not null,
	userid int not null,
    FOREIGN KEY (pid) REFERENCES Product(id),
    FOREIGN KEY (userid) REFERENCES Admin(userID)
);





CREATE TABLE Product(
	id int IDENTITY(1,1) Primary key,
	name nvarchar(max),
	image nvarchar(max),
	price money,
	description nvarchar(max),
	cateid int,
	sellid bit,
	quantity int,
	FOREIGN KEY (cateid) REFERENCES Category(cid)
) 
drop table Product;
CREATE TABLE Category(
	cid int Primary Key,
	cname nvarchar(50) NOT NULL
)

insert into Category
	(cid, cname) values
	(1, N'Nước ngọt có gas'),
	(2, N'Trà'),
	(3, N'Nước trái cây'),
	(4, N'Nước tăng lực'),
	(5, N'Nước có cồn')
select * from Category
drop table Category;
SET IDENTITY_INSERT Product ON 
SET IDENTITY_INSERT Product OFF
insert into Product
	(id, name, image, price, description, cateid, sellid) values
	(1, N'Nước giải khát có gas Coca Cola lon 330ml',N'https://product.hstatic.net/1000288770/product/nuoc_giai_khat_co_gas_coca_cola_lon__320_ml_b82c142ef49646738eb3df94c13053ae_master.jpg',
	10.0000,N'Nước giải khát có gas Coca Cola được nhiều người yêu thích với hương vị thơm ngon, cùng vị ngọt lan tỏa ngay từ khi bắt đầu thưởng thức. Sản phẩm không chỉ giúp giải tỏa cơn khát trong những ngày nóng nực mà còn cung cấp nguồn năng lượng cùng hàm lượng khoáng chất dồi dào, cho bạn khơi lại hứng khởi.', 1, 1),
	(2, N'Nước giải khát có gas Pepsi lon 330ml', N'https://product.hstatic.net/1000288770/product/nuoc_ngot_pepsi_cola_lon_330ml_5d1df64d846f4f93aa666c723cea177d_master.jpg',
	10.0000,N'Nước giải khát có gas Pepsi được làm từ những thành phần và hương liệu an toàn cho sức khỏe mang đến chất lượng tuyệt hảo cho sản phẩm. Ngoài ra, thành phần của nước giải khát Pepsi cũng không chứa các chất bảo quản độc hại làm ảnh hưởng đến sức khỏe người tiêu dùng.', 1, 1),
	(3, N'Nước ngọt 7 Up vị chanh lon 320ml' ,N'https://product.hstatic.net/1000288770/product/nuoc_ngot_7_up_vi_chanh_lon_235ml_04dd0bd25acd41a2b267c7e5fee240fe_master.jpg',
	10.0000,N'Nước ngọt 7 Up hương chanh có vị ngọt vừa phải và hương vị gas the mát, giúp bạn xua tan nhanh chóng cơn khát, giảm cảm giác ngấy, kích thích vị giác giúp ăn ngon hơn, cung cấp năng lượng cho tinh thần tươi vui mỗi ngày.', 1, 1),
	(4, N'Nước ngọt Sprite hương chanh lon 330ml', N'https://product.hstatic.net/1000288770/product/nuoc_ngot_sprite_huong_chanh_chai_330ml_9d2547c1d1c24343b7d7356f04c4651c_master.jpg',
	10.0000,N'Nước Giải Khát Có Gas Sprite với hương vị thơm ngon, không chỉ giải tỏa cơn khát trong những ngày nóng nực mà còn cung cấp nguồn năng lượng cùng hàm lượng khoáng chất dồi dào.', 1, 1),
	(5, N'Nước tăng lực Monster Energy lon 355ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_monster_energy_lon_355ml_0d9828bb1f314fdab19b76330545c7db_master.jpg',
	24.0000,N'Monster là thức uống dành cho thế hệ trẻ dám sống khác biệt và đương đầu với thử thách mới. Monster luôn gắn kết với các hoạt động thể thao phiêu lưu mạo hiểm, những trò chơi trực tuyến và âm nhạc sôi động.', 4, 1),
	(6, N'Nước ngọt Fanta vị cam lon 330ml',N'https://product.hstatic.net/1000288770/product/nuoc_ngot_fanta_vi_cam_lon_330ml_9d50e6b4cb864f299cbcba3934b3bd2b_master.jpg',
	10.0000,N'Nước giải khát hương cam Fanta chứa nhiều vitamin C sẽ cung cấp năng lượng cho cơ thể trong một ngày dài hoạt động.', 1, 1),
	(7, N'Nước ngọt Mirinda vị cam lon 330ml', N'https://product.hstatic.net/1000288770/product/nuoc_ngot_mirinda_vi_cam_lon_330ml_ed72c855bec44a34b84db5fe21ad5154_master.jpg',
	10.0000,N'Nước Ngọt Mirinda Cam được sản xuất trên dây chuyền hiện đại, bạn có thể hoàn toàn yên tâm về chất lượng sản phẩm. Hương vị cam đặc trưng, không chỉ giải khát, mà còn giúp bạn lấy lại năng lượng cho hoạt động hàng ngày.', 1, 1),
	(8, N'Nước tăng lực Warrior hương nho lon 325ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_warrior_huong_nho_lon_325ml_4b74a283592846fc8f67c49c2788d1f2_master.jpg',
	12.0000,N'Nước Tăng Lực Warrior Vị Nho Lon 325ml với hương vị nho thơm ngon, ngọt dịu mà không gắt cổ, có chứa nhóm vitamin B (B3, B6, B12) giúp thúc đẩy quá trình trao đổi chất, cung cấp năng lượng bền bỉ cho cả thể chất và não bộ.', 4, 1),
	(9, N'Nước cam ép Twister Tropicana lon 320ml', N'https://product.hstatic.net/1000288770/product/nuoc_cam_ep_twister_tropicana_lon_320ml_f26a57aa8b4b41b5a75f24e31fbec600_master.jpg',
	9.8000,N'Twister Cam Sleek 320ML được chiết xuất từ những tép cam tươi nguyên chất tươi ngon và bổ dưỡng, bổ sung thêm nhiều vitamin A, C và năng lượng cho cơ thể.', 3, 1),
	(10, N'Nước tăng lực Sting dâu đỏ lon cao 330 ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_sting_dau_do_nhan_sam_lon_330_ml_91ff57b2a2494cfda74b9cd8c66c32e6_master.jpg',
	10.0000,N'Nước Tăng Lực Sting Dâu có hương vị tự nhiên của dâu tây đỏ kết hợp với những hương liệu phụ một cách hài hòa tạo nên sự thơm ngon, hấp dẫn.
	Với taurine, inositol, vitamin B, kết hợp cùng nhân sâm, nước tăng lực Sting dâu tây đỏ mang đến nguồn năng lượng dồi dào cho cơ thể, giúp bạn luôn tràn đầy năng lượng, vượt qua mệt mỏi.
	Nước tăng lực Sting dâu tây đỏ được sản xuất trên dây chuyền hiện đại theo công nghệ tiên tiến, dưới sự giám sát và kiểm tra nghiêm ngặt của các chuyên gia trong ngành công nghệ thực phẩm.
	Thành phần: Nước, chất điều chỉnh độ axit, chất điện giải, đường mía, hương tự nhiên, hương dâu tây, caffein, nhân sâm… Hướng dẫn sử dụng và bảo quản: Dùng trực tiếp, ngon hơn khi ướp lạnh. Bảo quản nơi khô ráo, thoáng mát. Nơi sản xuất: Việt Nam.', 4, 1),
	(11, N'Nước tăng lực Monster Energy Ultra Paradise lon 355ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_monster_energy_ultra_paradise_lon_355ml_5d88cae1d4314c448823119789043447_master.jpg',
	30.0000,N'Nước Tăng Lực Monster Energy Ultra Paradise Lon 355ml với hương vị táo và kiwi thơm hấp dẫn, vị ga sảng khoái, dồi dào các thành phần dinh dưỡng giúp tăng lực hấp dẫn như vitamin, taurine, caffeine, inositol,...Nước tăng lực Monster Ultra Paradise 355ml chính hãng nước tăng lực Monster được sản xuất tại Malaysia cho bạn cảm giác sảng khoái
	Nước Tăng Lực Monster Energy Ultra Paradise với hàm lượng caffeine khoảng 120 mg trong một lon nước có dung tích 355ml giúp đem đến sinh lực dồi dào và minh mẫn, đánh thức năng lượng hoạt động cả ngày dài. Đây chính là thức uống lý tưởng với những công việc đòi hỏi tập trung cao hay phải di chuyển nhiều. 
	Nước Tăng Lực Monster Energy Ultra Paradise được sản xuất trên dây truyền hiện đại dựa theo các tiêu chuẩn kiểm định khắt khe của Nhật. Chất lượng Nhật Bản giúp bạn yên tâm về chất lượng cũng như vấn đề về sức khỏe khi sử dụng.', 4, 1),
	(12, N'Nước ngọt Fanta vị việt quất 330ml', N'https://product.hstatic.net/1000288770/product/nuoc_ngot_fanta_vi_viet_quat_lon_330ml_ac374fec5ce548db85e479188b27870d_master.jpg',
	10.0000, N'Nước ngọt có gas của thương hiệu nước ngọt Fanta nổi tiếng giúp giải khát sau khi hoạt động ngoài trời, giải tỏa căng thẳng, mệt mỏi. Nước ngọt Fanta hương việt quất lon 330ml thơm ngon, giúp tiêu hóa thức ăn nhanh hơn, tránh đầy bụng, dễ dàng thưởng thức được nhiều món ngon hấp dẫn', 1, 1),
	(13, N'Nước tăng lực Monster Energy Mango vị xoài 355ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_monster_energy_mango_vi_xoai_lon_355ml_1d4908e0231249668078c652c02b55de_master.jpg',
	30.0000,N'Monster Loco Vị Xoài là thương hiệu nước tăng lực hàng đầu tại Mỹ, là biểu tượng toàn cầu và có mặt trên 125 quốc gia. Monster thể hiện đẳng cấp, phong cách sống khác biệt, là hiện thân của sự mạnh mẽ, huyền bí và vui nhộn. Kết hợp cùng vị Xoài độc đáo tạo nên sự kết hợp tuyệt vời mang đến nguồn năng lượng tích cực.
	Mango Loco là sự pha trộn tuyệt vời của nước ép Xoài lạ miệng nhất định sẽ thu hút cả những tinh thần cứng đầu nhất. Vị ngon tuyệt vời với lượng dồi dào vừa đủ để giữ bữa tiệc kéo dài lâu hơn.
	Monster là thức uống dành cho thế hệ trẻ dám sống khác biệt và đương đầu với thử thách mới. Monster luôn gắn kết với các hoạt động thể thao phiêu lưu mạo hiểm, những trò chơi trực tuyến và âm nhạc sôi động.
	Hướng dẫn sử dụng Lắc nhẹ trước khi uống, dùng ngay sau khi mở nắp. Ngon hơn khi uống lạnh. Bảo quản: Để nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp hoặc nơi có nhiệt độ cao.', 4, 1),
	(14, N'Nước tăng lực Monster Energy Ultra lon 355ml', N'https://product.hstatic.net/1000288770/product/nuoc_tang_luc_monster_energy_ultra_355ml_509b19798c064ff4ac51922b09ec59e0_master.jpg',
	30.0000,N'Monster Energy Ultra là nước tăng lực hàng đầu tại Mỹ, là biểu tượng toàn cầu và có mặt trên 125 quốc gia. Monster thể hiện đẳng cấp, phong cách sống khác biệt, là hiện thân của sự mạnh mẽ, huyền bí và vui nhộn.
	Monster là thức uống dành cho thế hệ trẻ dám sống khác biệt và đương đầu với thử thách mới.
	Monster luôn gắn kết với các hoạt động thể thao phiêu lưu mạo hiểm, những trò chơi trực tuyến và âm nhạc sôi động. Hướng dẫn sử dụng Lắc nhẹ trước khi uống, dùng ngay sau khi mở nắp. Ngon hơn khi uống lạnh. Bảo quản: Để nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp hoặc nơi có nhiệt độ cao.
	Thành phần: Carbonated Water, Acid (Citric Acid), Taurine (0.4%), Acidity Regulator (Sodium Citrate), Flavourings, Panax Ginseng Root Extract (0.08%), Sweeteners (Sucralose, Acesulfame K), Caffeine (0.03%), Preservatives (Sorbic Acid, Benzoic Acid), L-Carnitine L-Tartrate (0.015%), Vitamins (B3, B5, B6, B12)
	, Sodium Chloride, D-Glucronolactone, Guarana Seed Extract (0.002%), Inositol.', 4, 1),
	(15, N'Nước táo lên men Strongbow gold Apple vị dâu đen lon 330ml', N'https://product.hstatic.net/1000288770/product/nuoc_tao_len_men_strongbow_gold_apple_vi_dau_den_lon_330ml_1efeede9104a49ee9784bbeb520aa8e7_master.jpg',
	20.0000,N'Cider (Apple Cider – hay nước táo lên men) là loại thức uống có nguồn gốc từ châu Âu và đã phổ biến toàn cầu với cách thức chế biến đầy ấn tượng từ quá trình lên men táo tự nhiên mang đến men say thuần khiết, hài hòa và đầy cuốn hút.
	Với một chút ngọt dịu, thanh mát kết hợp cùng vị chát nhẹ đặc trưng của táo cùng độ men vừa phải đủ để lâng lâng hứng khởi, Cider trở thành thức uống hội tụ đầy đủ tinh hoa một cách chọn lọc từ thiên nhiên.', 5, 1)

	insert into Product
	(id, name, image, price, description, cateid, sellid) values
	('16', 'Nước ngọt Pepsi không calo lon đen 320ml', 'cc', '100', 'blabla',1, 0)

	select*from Product where sellid = 1;
	select * from (select ROW_NUMBER() over (order by id asc) as row, * from Product) as x where row between 1 and 3;
	select * from Product where name like '%ga%';
	select count (*) from Product where name like '%ga%';
	select * from Product a JOIN Category b
		ON a.cateid = b.cid;


select * from Product a join Admin b on a.sellid = b.userid where a.sellid = 2;
select * from Product a join Category b on a.cateid = b.cid where cateID = 1 order by id offset 0 rows fetch next 4 rows only
select count(*) from Product a join Category b on a.cateid = b.cid where b.cid = ?
select * from Category