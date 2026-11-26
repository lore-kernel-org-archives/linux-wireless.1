Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658859;
	b=sIe23Ukw1chioXiMAXJN+f0tXvdoXxBtt8pfqXjiVghlJH0XKPJk8HllEGESKsZvtOfA
	 B6XdboYxM8Uz/aIJYMtecHPxblVUHlc8P3Uvd4PBcD565XmHItVEU1VJrFHeWXhHzAQw+
	 XZU25Iuwc3ghrXXhrotjh0iyxu7HDdjPAGEQx6XyDWszhCDOZtLLAoroKEsSCPqMePhZ1
	 OUa3QrhUlAyFVYz8JiA/fPcqQ5yWr45vUXQ7wtEoG+vEXtpgmSwF5LNULYSneJWBwq4kv
	 hdv9yNYOAYHE8L9RAnPhC9VLpDgtZnJKjp4DHyotmjuzc02hwBoPyTK8YJFgkAMWA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
	b=awCMeaH5uBx19yhAfpbvKlMpw3O6lnXye87q30JpbA+UtMrOGaLFTEYapmRQR8/GhxN0
	 cNmUdq6JHQ5y6xRZ+WCLf1Xn224irEx77M204T5pwB/dDLkNdjE1aMLUGq2s/9pZxDWhk
	 3eyLHnacYxo3iwxixGLbGGJKcde3PwvVLncPGFMxoUABp1DbHrV6AdQ3lUHjfC2w4Umhe
	 6Gl4Odl22rIKv7glSzemHLMT8CfXaSwuTf4lvSk/AYfOANY9qsA0HuLum859CMr7jVRPs
	 2NeRDFRYTU9nAUFbzruyAphDaRZ2+yamHBkAXupeh69S3ZtDgNCfEL+gzRMW0xDe7IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=augfP6Zw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=foOqpnS+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5C606A338
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B5C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=augfP6Zw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=foOqpnS+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAoog2028165
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0R6kz49hV3A
	Zznu/COs3CzoBAvj0flKjT5W/5U4wY7U=; b=augfP6Zw91OUSzboB9QrvNdpqm0
	m3I6YkxtsxmTZvi1qf/QzK+sevb250QZbdndMDGUm82CSvKGp8QAf+ZKQHp3ylJR
	3dK/5qL1kh5sPosvak2mBAsorAmlBm6dKwqyk6cb9pbn1QH+PqdAp7wPBsnJ5BS7
	71eGRs/2VxDo20HAoqat4acL+22lZONWv2V3LYJTS63E8dgnZeelW8ubg9pBkQRh
	vjPCxklr+n085F1PZFS4TFGq1d/uhB9RzILC0rBD9EDqrTcfREFnVVkyvnEAPGDz
	WugNz6cPbH/9RPNznHkxoNeIhNyBqyOBd9dn36OW5MP4kDIwRR8P/MhP7Ag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vasub0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 02:07:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so4543184a91.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 18:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658858; x=1796263658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=foOqpnS+3n/cugr44g7OgR7+YG8MwZmo0ZfJUqpo65oFtc3NWg1W86ObdvgFKrXLzT
         Mme5mYI3qfIA+ORCPsbxSKgt3UEfcl/xPh3mR8/zT7fe8rB+fkdC2ezlIl0naUbGQZVI
         V755TQc84QWz2AWCEa+wP1577F0UvQiEIdPBH4+KAAbOskA1kr00vad/VC/Ft9tDVR8u
         zb8wfBdTnox8ObYnukBt9z7vbCDbO8HI/XvVcO6fE/cLfSkQtktlwcvlKIFu8heq0oTh
         jBV7Vle5Exw3UOotnimwdF4EruW3kaJp+Nq+akLm7p9yUQQxCEIjCT2188Wsxey1y2lD
         eXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658858; x=1796263658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0R6kz49hV3AZznu/COs3CzoBAvj0flKjT5W/5U4wY7U=;
        b=kvanM/gutkS/+ka/aJMfI1uciPQjPQ3PJG/In0q2hAatrWu9G9WsNBgk10zU+xJmp7
         h2OBoLQwqoP1+vzyB0SlZ0v2ajAU6sCUJhQlbRQnW2/aB15+E3tCQaWTC4n3WHKwlaPL
         l5ldolYikQdMd5mLTg+JKuwuUsym7n2mo2Qw9dPUXuSadK+lJDT2vm/LNDpBAUqreWEX
         M33pkDLssMf65L8W9PdaQyYqOeFECPrZyLYnP73hl72dVU6miv//sjKiISv7lPM6iSyX
         FPvA32OzawuYHOLXAL8OXZhZq6r4s1MlZH6FBbs+9ofCBAxN32RtG5sSAUMR09Nrfvlr
         h+PA==
X-Forwarded-Encrypted: i=1; AL+hErHFcZD8sse6JQ/AHm0xMhgi5HMEhN4MGNaqbIw3iIDYuFvLqaY/G3v+ESI1B64R+f/So3KhOHd9fzVlGWbGFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eb4I9160Bn9zqtFA6kvnYh8EKBv1m3gofMs2ygrvIsveG09zK
	lbjHQ0Ln8XqdqNOFtVX/KJpf/Qx1M9Iaw3gcDHqWzZo8Q3nYxzqWl4KW+RsnKXDCdWiYqIH8rkr
	Uf1b+LpAkC4IUE4xgLz9Rxw82U1pLQbNIqrNVf3VoAxX1A3rULQH+2Jy9eIm/CpPV5JnS+w==
X-Gm-Gg: AZFdTZdp8i8TFedQ2sjBxnFTsD1xulMHIn6IRsEYprJPF/SBstVP5VedzmHHf2GFfIn
	nedD49FTjYGTIqvMhjij5F/nZf47T9aSS6IjvnfmrH+aoIhxCDvcX2fFv6ziJUkSqMTf3ndNBJ6
	tMENPGOVGd0wFJm0ntxEiPkb8rFxUN5FO9YJ/O/44vRBq3QmNYTw/l+1+kVFceF3hFh4WR/uCEw
	r9JJ3rM4aauv5Y/ksogPv+cc7LFwCmRSXZnqvYCTw2zEdOz4XKhlL6wLhGM7qVtKHApK8pLW2kS
	ht75VeK0ajBvqTRZaMCEJ7syEh2WGDh2P5ROkF0R4MulsNSwQ4hix1ukF65tNu1jUgwHSwQV/Ll
	UyKkyWHeUbIx3eikkiGBlquyrqLd+lHMryX9mIyaHzGKKlQhfU0MA6S04Q7rdcOGfhS9016UaI7
	WNadVtygxmbuVvuqQd1JkqacovnSpa5N9xy5i8
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705215a91.37.1795658857904;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr13705190a91.37.1795658857147;
        Wed, 25 Nov 2026 18:07:37 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:36 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/6] wifi: ath12k: derive MLD max simultaneous links by hw policy
Date: Thu, 26 Nov 2026 10:07:23 +0800
Message-Id: <20261126020727.3273337-3-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXyeuznxGEl1ta
 pcPhoTEsb1LKclyHLNulClERxnqIKmjiNo/2omrNsRmoteQZLJ5L92aEDU0L0LgIgPheT8+xepp
 EGMX1Fdz21cYK2GGqxwP97t1MtdMe/Y=
X-Proofpoint-ORIG-GUID: 3mAhycymmH1xcIJsMfiB07xfeKfD3Ajf
X-Proofpoint-GUID: 3mAhycymmH1xcIJsMfiB07xfeKfD3Ajf
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07946a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HJkC1t53WzKw9mxX8OcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX2vvHTM+xV1mO
 s1jy9VH9iAJDPKkq9HpJiXnzc347yQK1oWp1ArWrQ7NOsvIIAmTcEWbJH/i/8LgJanI+TzD2jWj
 n7872gtX4KPWTRQCz2myDwS29E98ToIuNiNNt6SS4h/zac5za4mnzFnGcK5TmIxhvxuhmiD/FqD
 QjzY6T+SkWweQJtT8Xf9bAhg4caQwv/VjPQscvAnGB8wYMh1dzYe9u9IjhdT6qPD3EOJGpgqy8a
 ILQ41h9tM5zdvOHl/My2MguHGjzQGiJXGJrCRpH2ORhrKWFJBk09yy28goSvLX3fHTwOdLQE5i2
 gLfq3wqC+8wb4hsuOSTKKOD6unCdUNoy0rXGF9G2UPnZfGNyUl6uHXKsuxDJe44NX0nCIwchXHC
 SfKeaGpC6kxEjbVKtId3uN9Z2GKjRzL+1y4utThTFWMOs9C6+DahK0ER09r/3zrUjYCutiwPKWm
 OdV2Exf2IW0rdpvnTRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

On infrastructure-focused chipsets, firmware may report a maximum
simultaneous-link count that does not reflect the available radio
combination. When the counts differ, converting the firmware value to
N-1 still advertises an incorrect Max Number Of Simultaneous Links in
the wiphy MLD capabilities exposed to userspace and in MLO association
requests. Userspace and peers therefore see a simultaneous-link limit
that does not describe the configured hardware.

Add mlo_max_simul_links_by_num_radios in struct ath12k_hw_params and
use it to select between firmware-field conversion and radio-count-based
derivation of the encoded max simultaneous links value.

mlo_max_simul_links_by_num_radios is enabled for
QCN9274/QCN6432/IPQ5332/IPQ5424 and disabled for WCN7850/QCC2072.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  7 +++
 drivers/net/wireless/ath/ath12k/wmi.c      | 67 ++++++++++++++++++----
 3 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 138e556ac679..7cd357f9429b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -218,6 +218,7 @@ struct ath12k_hw_params {
 	u32 otp_board_id_register;
 
 	bool supports_sta_ps;
+	bool mlo_max_simul_links_by_num_radios;
 
 	const guid_t *acpi_guid;
 	bool supports_dynamic_smps_6ghz;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..eef99b664748 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -472,6 +472,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -571,6 +572,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -666,6 +668,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = QCN9274_QFPROM_RAW_RFA_PDET_ROW13_LSB,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = true,
@@ -759,6 +762,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -855,6 +859,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = true,
+		.mlo_max_simul_links_by_num_radios = false,
 
 		.acpi_guid = &wcn7850_uuid,
 		.supports_dynamic_smps_6ghz = false,
@@ -949,6 +954,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
@@ -1039,6 +1045,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.otp_board_id_register = 0,
 
 		.supports_sta_ps = false,
+		.mlo_max_simul_links_by_num_radios = true,
 
 		.acpi_guid = NULL,
 		.supports_dynamic_smps_6ghz = false,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d1af43ede2ae..5cf104536dbf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,22 +5293,69 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
-static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+static u8 ath12k_wmi_get_max_simul_links_by_num_radios(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
-	u8 max_simul_links;
+	u8 max_simul_links = 0;
+	int i;
 
 	/*
-	 * Firmware reports Max Number Of Simultaneous Links as raw N while
-	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 * On infrastructure-focused chipsets, firmware may report max
+	 * simultaneous links independent of active radio combination.
+	 * Derive the encoded value from the number of available radios.
 	 */
-	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (ag->mlo_capable) {
+		for (i = 0; i < ag->num_devices; i++) {
+			struct ath12k_base *partner_ab = ath12k_ag_to_ab(ag, i);
+
+			if (!partner_ab)
+				continue;
+
+			max_simul_links += partner_ab->qmi.num_radios;
+		}
+	} else {
+		max_simul_links = ab->num_radios;
+	}
+
+	if (!max_simul_links)
+		return 0;
+
+	return min_t(u8, max_simul_links - 1,
+		     FIELD_MAX(IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS));
+}
+
+static u8 ath12k_wmi_get_max_simul_links_from_fw(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	max_simul_links = u32_get_bits(mld_cap,
+				       IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 	if (max_simul_links)
-		max_simul_links--;
-	else if (ag && ag->mlo_capable)
+		return max_simul_links - 1;
+
+	if (ag->mlo_capable)
 		ath12k_warn(ab,
 			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
 			    mld_cap);
+	return 0;
+}
+
+static u32
+ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab,
+				    const struct ath12k_wmi_caps_ext_params *caps)
+{
+	u32 mld_cap = le32_to_cpu(caps->mld_capability);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	if (ab->hw_params->mlo_max_simul_links_by_num_radios)
+		max_simul_links = ath12k_wmi_get_max_simul_links_by_num_radios(ab);
+	else
+		max_simul_links = ath12k_wmi_get_max_simul_links_from_fw(ab, mld_cap);
 
 	return u32_replace_bits(mld_cap, max_simul_links,
 				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
@@ -5319,7 +5366,6 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
-	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5365,11 +5411,8 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
-	mld_cap = le32_to_cpu(caps->mld_capability);
-	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
-
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = mld_cap;
+	pdev->cap.mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, caps);
 
 	return 0;
 }
-- 
2.25.1

