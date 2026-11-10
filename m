Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285193;
	b=Ptz+GY575yL9xe2ALEbD/g0G/AvCeF8+2QdyhLAve0DFxc70F9idrkJGNfS6r3cSbzJM
	 PSZTd95WgdoHZ2QbvCrxXOSe1ZfN+xQ9i3DmU7Pgh8Ae/xN57pHmJw6cUcz7+Ii3I0Nk8
	 ByXVBUVUv/CCyXfaajQ1Gu1UUYLW/HFwacASkm1eeM5l/YgClxhJBhF3vl9TYl/tAUolE
	 eSw//RdUuZEh0Zopx7hltcUAVuhxfH4SzmBQ6jqxGScZSCaSCU/3BuUTFAsPqfLQ1Q1VO
	 3tDdETZ/bbkAkNDHArIs6PSc3BYcOANlBCvfY3Ur/blcALZOYm92mXCvj2jmFOTv91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5H2BT0DUoYvC0gx7LhkOmbPVO0Hg7Df21jmaEgGZUuw=;
	b=CJlOj9qmcK7d67B9o3iZIyEY6XmdWuwUPBHpg/EYRQbA91j6Ykj0Vo4dxJ5/R6KAoyYc
	 BNohc3AWDgrLenh4+SEhWJtEo2DnDWAguhq+N+p1Cs1R2N9S2oA5EDr4rlzcVZ80zGoue
	 cunCuTRpnZg2BT2qVj6ToRkIG/oU7wPjEg0StfqEjzlRhqQ6di6Iaw5IgrTceCcaDx60H
	 4+8+UgaH3bUD5pws+yjRjfxuY8bYIL5qPRbkL4JPOMxMGBAuQEKDI75ssQWYB/GsRV872
	 EnP+CpAGK1SKyoDowiWd6TdbYyjBH/x/awPPJJdo1TaTVrjl5qN/esVs7z7IC761K3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGsVCa0c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCbIMj4J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1AA606A88D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1AA606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OGsVCa0c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCbIMj4J
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5621957598
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5H2BT0DUoYv
	C0gx7LhkOmbPVO0Hg7Df21jmaEgGZUuw=; b=OGsVCa0cUfUCOuKQRKAzLLls+C+
	Kl0S/AXHVv3TTf8BAL2i+tVxpDd/a8o7aReErK5q3b3JZr6/QGf4eNCT1yz7fV7A
	XSCxcjgFY0koHtmrqgKPmMpDQ0NKZBRuf8HfYsdfYoX3NdCwjVz1T7RgW4YCi3+r
	5NPhyMxd+EfmNJd0+9UfLsB5ODoJUNoNGMmHCisIzFY/JxytQYjOvQWyyoI+K0Yu
	28u1VoXlXqlTgrDdPmUu4HYkPEdrqrf9AMi9lDHvsxOxNqwsTLFYBJKtgJRCUy6g
	xyGDbJ1NRn9+vI1WSrY524t75oIuUvP0WfW6WXQhS+JeCJvsAOLkevyrNdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkk94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1279541eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285191; x=1794889991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5H2BT0DUoYvC0gx7LhkOmbPVO0Hg7Df21jmaEgGZUuw=;
        b=FCbIMj4JPACBKl9F0BvJ/K3dejfVGa2Y/zJpVtxZWNF4EjQpr//Dnpa5eB7ocMycji
         LwLaEuZNyoTvbm7nqa5diPjrU/vU29uIFgNcVCHtjrNiRTgSy8rhqiu1DUQ/Nd3m5JpB
         XTubT7IT3PWzIz0pCryyaNMUaSkauBMjpCXsJNV+DsDrECUBpWktLEfV3slNz85imbkb
         LdkjX2SGR1vnRnq5XhLHF0oqQv0fxR/SITPMqHfThn2oNCNY13UvldFB2+wj9DCCe8a9
         CNNpE7dah++YXisWUN8x0AhxgpX+St3gl13n/U/Qgr1LCYkT/+u33kyWqOvX/F5A8RUs
         Y9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285191; x=1794889991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5H2BT0DUoYvC0gx7LhkOmbPVO0Hg7Df21jmaEgGZUuw=;
        b=drPupGIteFgweXOPRljkniJRmOq5ERoeJN22PnJq66keBfptRzuksUhfEbGesKAKuM
         2rc8Tow+9G1LsxKdVX/MTg2lgCpZSdmZ9RuisWwyuosE179Y3HwGQvQ3S5IgDisCfxBv
         2SZyJM1hYmFNZkgPZkD5ahEKJifnV0f6w+t2W3M7YBZxzOaaQyrBQ//g/ZkcvDARYUk5
         mecHwhIa0RxfeP4DQ1nqp/rqFivRml3Yua1BQv7cip/JO1lbsPj1nCCOHXaJtI/l/Oyw
         GbTDRXlYI6CHPXp2CpueqSL22/yrNfAKfMWzZh9grCQZ1rYi3F7MTwKXjyixS03f3hZU
         /7Ow==
X-Gm-Message-State: APuU4Z+TDL+5+7dBusH/5Ar+scos/a4iBefdW1Nm1IXwCDCcoe8OXFmb
	UUMvNLkMulkqBki+VWN4mH0FD8BxxIKyZqgA2l04r+wfLKfbDlSex5J/mY/lGUeFC+cg1axYvAW
	hdCRaDAAP1GP+UDw+yXfQ6PPw0SgX4PgSe8qbCyYqD+gG8u9ZySY8ZQ7oagWgjGsKKJKzsA==
X-Gm-Gg: AYBFou3tEn0U6oiJMrn++azxXpPZfrabVdrp7Xy3O98phyyXTAgP7z/4eMiNbgDdh7d
	6sZhyPOh79nHq5QEI9NFBxazKhpunNMfvzw0UQNGMdgJreaMlJX7pFNNY0o6FIJy29bbWfCNwhD
	D+d9+N1KtHgxdW1R+ikFa+5460K8s44EEtBco40rXq36ylzRf3NatKvmMBhCsbqY1yRFq5NZ+vs
	4a24H02BGhQBLaQo9f165vwM7/VfqovhTOyM/lWuxTUqVSh0rsjm3fpsWhgYUvry2CuQ6eQfrkb
	Zebyhpk5IOoQ6a/0b8LlNNU/yQkjC/vZT3Mvgj3nA6ALd/94j6hjhd0c/ENtQbZuWb4USSzju4T
	pFKqHkxk2WBn1cDEleB2mundlyAnryds7pA32W34NKwxZkIYPv40kjq20SMfi4dFHmKkU1gt+FL
	dTJYs5DbMj8g==
X-Received: by 2002:a05:7301:fd16:b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-3751e99384amr1862046eec.8.1794285191199;
        Mon, 09 Nov 2026 20:33:11 -0800 (PST)
X-Received: by 2002:a05:7301:fd16:b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-3751e99384amr1862004eec.8.1794285190480;
        Mon, 09 Nov 2026 20:33:10 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:10 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 05/19] wifi: nl80211/cfg80211: advertise NAN ranging support
Date: Tue, 10 Nov 2026 10:02:28 +0530
Message-Id: <20261110043242.2012238-6-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX7aDjLJS/31AQ
 7IvWzJGwQAVNVFCZ25IWEPJaadyia1XIaGILsq3v3cvaN4CMx2lMcp9v8WuS9Gnvlddh3AloMyj
 5q6vX6izAQcZcwnbt1qpR8d6ovjiH5M=
X-Proofpoint-GUID: be0CwxIgiYwoJxHxuGBsxY54Pp3qMykF
X-Proofpoint-ORIG-GUID: be0CwxIgiYwoJxHxuGBsxY54Pp3qMykF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX9prn9cq7seDA
 FmneqxFOrQFhml/jpia8TZ3FzPghXUpDv66vjR+rnp0lybKwhXwPa9Pd7wQdtQRSidiGS9xZUA+
 bAhIQsUilOPj5t6A4FYijpE51p0+fKQesCN5LDNthzTIG6NoYw3v6qBYXg4mGZzuCM5nNHeT+Gu
 6J5z1vGU9EBfFsi11nM/uflfelKoqUA7q0BgPsemYkyjETzMTqRuTtzjkGp6zoif3fM0o04T+qU
 VnDQzGPDpArXTgwegVVAAh/WoOLr9RWxWuxCcmvMVE8gf7FEiGRVT/OP7WGgRRRjIixwyFvkqJu
 i1pb/Uf9IhFeeekgWkM1uM7g9R9DmEtLoIez2NS4ejxpgtIOwit5TJ1uGQHJ9AcGK7clnEzj7Xx
 pOskJmHqfzX5x8IBco/S+hSICsCV84nW/nQTgTbAd+2HLgGFJoBBLUdTslSECkLbMsW0BrZrQT+
 +KXRBQ6Jh5ksmgJ47uw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af29e88 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AEF9MEfIqb847dwsdnUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Add NL80211_NAN_CAPA_OFFLOAD_RANGING so userspace (e.g., wpa_supplicant)
can determine whether firmware supports fully offloaded NAN ranging
before starting a NAN ranging session.

Add WIPHY_NAN_FLAGS_OFFLOAD_RANGING for drivers to report this
capability and expose it through the NAN capabilities handler.
Fully offloaded NAN ranging includes ranging session setup, update,
and termination, FTM protocol and procedure, and ranging report.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 4 ++++
 include/uapi/linux/nl80211.h | 4 ++++
 net/wireless/nl80211.c       | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 91bc06a46a3f..2c5f1a7e5722 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6383,11 +6383,15 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_USERSPACE_DE: Device doesn't support DE offload.
  * @WIPHY_NAN_FLAGS_INSTANT_COMM: Device can switch to Instant Communication
  *     (IC) mode. Can only be set along with %WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
+ *	ranging procedure, including ranging session setup, update, and
+ *	termination, FTM protocol and procedure, and ranging report.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
 	WIPHY_NAN_FLAGS_USERSPACE_DE   = BIT(1),
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
+	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index bd18cb922310..17b3bbc04d8b 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -9201,6 +9201,9 @@ enum nl80211_s1g_short_beacon_attrs {
  *	of the Wi-Fi Aware Specification v4.0. Can only be set if
  *	%NL80211_NAN_CAPA_CONFIGURABLE_SYNC is set. When IC is enabled, the IC
  *	schedule is expected to be configured by user space.
+ * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
+ *	fully offloaded NAN ranging procedure, including ranging session setup,
+ *	update, and termination, FTM protocol and procedure, and ranging reports.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9215,6 +9218,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_CAPABILITIES,
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
+	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index ca08b40baf96..3c9847a83311 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3183,6 +3183,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_INSTANT_COMM))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_RANGING) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
-- 
2.34.1

