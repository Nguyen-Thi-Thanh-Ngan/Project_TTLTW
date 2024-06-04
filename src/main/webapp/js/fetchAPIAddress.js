$(document).ready(function () {
    /*Lấy api tỉnh thành*/
    $.ajax({
        url: "https://online-gateway.ghn.vn/shiip/public-api/master-data/province", type: "GET", headers: {
            "Token": "7e2513c5-ed99-11ee-983e-5a49fc0dd8ec" // Thay thế bằng token thực tế của bạn
        }, success: function (response) {
            if (response.code === 200) {
                var provinces = response.data;
                var provinceSelect = $('#province-select');
                provinces.forEach(function (province) {
                    provinceSelect.append('<option value="' + province.ProvinceID + '">' + province.ProvinceName + '</option>');
                });
            } else {
                console.error("Error fetching provinces", response.message);
            }
        }, error: function (error) {
            console.error("Error fetching provinces", error);
        }
    });
    /*Khi tỉnh thành đuọcw chọn thì quận huyện cập nhật theo tỉnh thành đó*/
    $('#province-select').change(function () {
        var provinceID = $(this).val();
        if (provinceID != null) {
            $('#district-select').empty().append('<option value="">--Chọn Quận Huyện--</option>');

            $.ajax({
                url: "https://online-gateway.ghn.vn/shiip/public-api/master-data/district", type: "GET", headers: {
                    "Token": "7e2513c5-ed99-11ee-983e-5a49fc0dd8ec"
                }, data: {"province_id": provinceID}, success: function (response) {
                    if (response.code === 200) {
                        var districts = response.data;
                        var districtSelect = $('#district-select');
                        districts.forEach(function (district) {
                            districtSelect.append('<option value="' + district.DistrictID + '">' + district.DistrictName + '</option>');
                        });
                    } else {
                        console.error("Error fetching districts", response.message);
                    }
                }, error: function (error) {
                    console.error("Error fetching districts", error);
                }
            });
        } else {
            $('#district-select').empty().append('<option value="">--Chọn Quận Huyện--</option>');
        }
    });
    /*Khi quận huyện được chọn thì phường xã sẽ câpj nhật theo quận huyện đó*/
    $('#district-select').change(function () {
        var districtID = $(this).val();
        if (districtID) {
            $('#ward-select').empty().append('<option value="">--Chọn Phường xã--</option>');
            $.ajax({
                url: "https://online-gateway.ghn.vn/shiip/public-api/master-data/ward", type: "GET", headers: {
                    "Token": "7e2513c5-ed99-11ee-983e-5a49fc0dd8ec" // Thay thế bằng token thực tế của bạn
                }, data: {"district_id": districtID},
                success: function (response) {
                    if (response.code === 200) {
                        var wards = response.data;
                        var wardSelect = $('#ward-select');
                        wards.forEach(function (ward) {
                            wardSelect.append('<option value="' + ward.WardCode + '">' + ward.WardName + '</option>');
                        });
                    } else {
                        console.error("Error fetching wards", response.message);
                    }
                }, error: function (error) {
                    console.error("Error fetching wards", error);
                }
            });
        } else {
            $('#ward-select').empty().append('<option value="">--Chọn Phường/Xã--</option>');
        }
    });
    /*Khi phườg xã thay đổi thì giá tiền sẽ cập nhật*/
    $('#ward-select').change(function () {
        let fromProvinceID = 202; // Thành phố Hồ Chí Minh
        let fromDistrictID = 3695; // Thủ Đức
        let fromWard = "90737"; // Linh Trung
        let toProvinceId = parseInt($('#province-select').val());
        let toDistrictID = parseInt($('#district-select').val());
        let toWard = $(this).val(); // Sử dụng giá trị của phường/xã
        $.ajax({
            url: "https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee",
            type: "POST",
            headers: {
                "token": "7e2513c5-ed99-11ee-983e-5a49fc0dd8ec",
                "shop_id": "4982538"
            },
            contentType: "application/json",
            data: JSON.stringify({
                "service_type_id":1,
                "from_district_id": fromDistrictID,
                "from_ward_code": fromWard,
                "to_district_id": toDistrictID,
                "to_ward_code": toWard,
                "height":20,
                "length":30,
                "weight":3000,
                "width":40,
                "insurance_value":0,
                "coupon": null,
                "items": [
                    {
                        "name": "TEST1",
                        "quantity": 1,
                        "height": 200,
                        "weight": 1000,
                        "length": 200,
                        "width": 200
                    }
                ]
            }),
            success: function (response) {
                if (response.code === 200) {
                    $('#fee-delivery').html('<strong>' + response.data.total + ' VND</strong>');
                } else {
                    console.error("Error calculating fee", response.message);
                    $('#fee-delivery').html('<strong>Success nhưng lỗi</strong>');
                }
            },
            error: function (error) {
                console.log("Error calculating fee", error);
                $('#fee-delivery').html('<strong>Lỗi thiệt</strong>');
            }
        });
    });

    $('#province-select').select2();
    $('#district-select').select2();
    $('#ward-select').select2();
});
