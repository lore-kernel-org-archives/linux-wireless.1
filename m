Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983796;
	b=avm05iyv7aWoXXsLBeCHXV4dwq+ITgU7W8/+Ab78oEB3Sv56U6YU5sEhPpstOM/gQ1wN
	 49FrtZkZxPVTKVMyVHRxjKFFj9PkKpkEf5oJna3YmO1cijkKcTqk7hDoE2UIcnFUtThaD
	 G7/mkUG489xhLSneOSiRZdYIb7H4zp9dZK0WoOtcQBQF1hGTAT7cXUmTOCy5W2PjkHdU4
	 GpjhnlUd56a7lHGxTNwweTgNc6wJtQJJDPzh6JR42GoKdrnP/IVH2xRDUOmmaGofGNgKB
	 Wx2caTiszXgPE1dT461Z9ey5jmG71F0HZzQW3K49Xf2/6ss780xXvw1F3tTC3S3ljVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
	b=C0Rg8tHwwx7rLcnwVral0wrClwpe4kODYz2c/bHaThx5I5ZBR8eWDIj8G9BreimGZwfK
	 XB51YFvFESmiaxMfgP9yyX3X7dJjb/LfTOpLkNP/QqGbrr0ddvEiOrs3Jb/9Pv3Yoqwx3
	 GH9eIUNZ141SdQO7du+RwolBlaysKL6TnsksBiBVdQclMXMPw4meTnHIotiB1bzVWwb8z
	 ZOUMEZcmOBGkOvdgoIgNWubHqV+g3ZnDZJw9tkwPzk3lyP3CZzHCSQr8h5tlLvJucXcfB
	 s89Ic+XHuh+AFJkA1J5Cs5/mFj+xLqJWhIaMpk3y6qN0G6M6sdixUNOb2fBU84KEbHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyB1zPvb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaF101Vd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0497606A335
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0497606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyB1zPvb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaF101Vd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1w71430569
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xz+tn0n43a3
	oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=; b=AyB1zPvb6GeGmubijbb51t41wuh
	79B9Hg0/Qblf2iQ4U/KY2yW7J9/lfXueJqRiYGwcMLh1OkyDWvZv9ljymHk0CpA4
	s5/3JiBqhdEkFqE2igLjjXlmgxhlxyQ1g5r5wHbbmvQL2xVmZ+FO6NdJXCBSxQAR
	9Hl9B4blILj0qaxt2uGwj2G75qw1STKh0EfLuIffMAxx4PSDj/ISoAJ+pYFEhyCd
	c688NasAuX7DW2AWBRVwQDWC1hQPSvzgOm8rYQ98C4kHFD9tGpr3VhuNE6r/4Mzd
	zay7yMPQM2vbPOMPFuEN0Y4EuEN+/BdQSFmhp2D8hzYi8PC8rTlajGQpTUg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91kwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso835038eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983794; x=1795588594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
        b=OaF101VddKYlqW9gSfENqjn2j5NyU952h83LrBztfmVeeVz0pxrf4EMB3XdpqXuDBw
         OXUUpdDqgLXsXAY+XtvukTSHPuJIlnbGM58C3BnJWLGagWwlM6qub9bjyr8Bh+4fEjIi
         J5m0g1fxnoTO7kNtYNN5MbJEDKjiUCBkfTYkDX+kGEZYa0Xxym8Ii3yh11Zk/QMaTuKV
         JG/4m3uh2V7fopUKV1WyBEMT5pJgW0tO9v5ys/gCysnioaN9NlhyNFLD/JSbOb9Osthg
         wsdyIN4IMUvcogq9Wm+nXSeo8zE5oCkI+dCSOpf55Oe01hfbaSTU8sxQh2lEfIagjfO3
         DHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983794; x=1795588594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz+tn0n43a3oFJSrHUMSUCVvwEuaMEY0kTDVhYVMmmk=;
        b=YeKWk68IkuWEg/1EsCQFkqtDeAj7I74hkCF+zED1ap2uSeAwm+IhXoTh/oh6Lr8/gG
         ZWmP6PXoEmkHPSf4+x0bXXqmC6gHT9S4aifK64UrRscuwqJqJxJLpsNft942TIbaz4W5
         MSy1ZLIERRgYgiPhXiz/oxEUy9JVUQVWwaEq4o2tTkJPt3PQOeB+WUo3eU9uG8WunTja
         k0nWzuGEMl+/qFHQdT8QVp4Or1RaR2JnQSOT/tAb5ueW1YRErsYkJc/+4G7i0w9BeLkm
         YsmpR/q/pJ7HfnEbmt/Q6JEcyUsFkTqSTWiTjMtURhk8PJsfwoX1gHU/ACZeChTGtNju
         NQWw==
X-Gm-Message-State: APuU4Z8slHyyq/EOBpeEf/ZePArR0KKL2hoxYD84G7E/hNjnWIHEhqOl
	TK+SpNogkaL0lwwKfZxhJDquZlTxW84FYPZr3kI8SM4OaGZR+0rAvENp+aR3uRRB0/upnifYmli
	5fOBFzpRNTBzLFNRFwBuz3UynguvrlqMfLqFPWACUiHrNIpqqZe+PLF0s6kd405rK6BzJWQ==
X-Gm-Gg: AZFdTZfU4wE2LAv6jb39PKzJkOpjAFfpn6MpiyXi1jGSIINFu0WqucjE7Syp2RFCQEu
	o2RqMSoXseYgGiSBkHawugK+Bc2Oy6ssfTvVl+HPwdDpfnIA3G/pY1LXwn7/xlr3J+dtJptz3rH
	nK4rfiL3QM+ceSMTjLu7IjeRsGyJ00uYHpYRObLyg9t7KHEeQ/T7ZESlvjlsJF9m5rtlU5mwL7M
	uN/syzEKALq0rFZ5vJ8AhWVIkbL12QKxHsoZiG+7GKzmFaokhYrvoZPtBqt5Wj10PpVDrAXW6mm
	LYajLIru4A5HfQQlyQOujHqiZnGoKQaLhHj7r9qVvAhpDCOCgEugFPymGv6ADmwwghfTKqld0xl
	dTAXmId4dwDqQ++ySJWwoeCF6JcC4WSa31q0vqlMkA0CkRpTatA+sgS76ZfrX6S03GnxEesVNaL
	MRU3PC43fQow==
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr1602977eec.13.1794983794201;
        Tue, 17 Nov 2026 22:36:34 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr1602957eec.13.1794983793588;
        Tue, 17 Nov 2026 22:36:33 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:33 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 08/19] wifi: nl80211/cfg80211: add ranging results to NAN match event
Date: Wed, 18 Nov 2026 12:05:43 +0530
Message-Id: <20261118063554.2260397-9-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
References: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX+9jPE/7ND5qA
 VHuzMdpLuavwdfrwSdylKVjILCt21xgBq8rlP8OtZ9xsCa3kROVm33kUvrVkf9jtBTqSs8K2hby
 IsKpqVjQ/vL4vv1zO3nsp84smI9IcqaVRyxNiDWv9xDS33Gz3CP74RZ5OqLwHf+zlz4hL65seyg
 Z4zxgdmfpo2MOutaBPBT7YHO+g4suTUC8TAqQxbwcj/dL0Mi3u3plAEwfX8uG+IGomoG5W1rcUj
 mYv0A+VW1MWZrMkbGNdhrAlSvAK1K0vj+L507gd1+ozpn3hxzxqpa5Jct8TIAjv9zccn8b4njrZ
 oayJX+EtX1x58MSX3zIF7vxPnEhT0aiJEXpn7jM+asEU9x7c7MUEQX89b1jL7KLAxDM20aVReuT
 zroos+P2Qpq6LySMFhnfejxYGVwA68+eFVXu+3tFYnntLRPSfMSnKQw8BKIMcg0byKsnam/n42g
 fuZMs70dBwNhLgzpMPQ==
X-Proofpoint-GUID: 9-ESmg5V0pB7kW7OV4q_vvegZwRk2vyO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX4gE0mLYFr3jM
 rPokwJqtAFi+2WyrJE43yFrPxA4LKVyQ9AcAdwXaTA553tXQUVSFSV4sz0Rke/TDYnu12lOK0C8
 URrAxEmlnnS40G84Nom5g/FdxzA+LvQ=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd4772 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=HBrtoi3ke_hx9toI9_oA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 9-ESmg5V0pB7kW7OV4q_vvegZwRk2vyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Extend cfg80211_nan_match_params with ranging_indication and
ranging_measurement fields to allow the driver/firmware to report
NAN Ranging results as part of the NAN Service Match indication
in offload mode.

Add the corresponding attributes NL80211_NAN_MATCH_RANGING_INDICATION
and NL80211_NAN_MATCH_RANGING_MEASUREMENT and serialize them in
cfg80211_nan_match() so that userspace (e.g., wpa_supplicant) can
receive the NAN Ranging Report along with the NAN Service Match event.

Send ranging info to userspace only if ranging_indication is non-zero.
ranging_indication is a bitmask with four valid combinations:
- bit 0 set: continuous ranging
- bit 1 set: ingress condition met
- bit 2 set: egress condition met
- bit 1 and bit 2 set: both ingress and egress conditions met

Leave validation of the combination to userspace (e.g., wpa_supplicant).

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  4 ++++
 include/uapi/linux/nl80211.h |  8 ++++++++
 net/wireless/nl80211.c       | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 6bb840a1aef3..9acb657a824e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -10770,6 +10770,8 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f);
  *	Only valid when @rssi_valid is true.
  * @rssi_valid: if true, @rssi contains a valid RSSI measurement.
  * @cookie: unique identifier of the corresponding function
+ * @ranging_indication: bitmap indicating the type of ranging performed.
+ * @ranging_measurement: distance to the peer in millimetres.
  */
 struct cfg80211_nan_match_params {
 	enum nl80211_nan_function_type type;
@@ -10784,6 +10786,8 @@ struct cfg80211_nan_match_params {
 	s32 rssi;
 	bool rssi_valid;
 	u64 cookie;
+	u8 ranging_indication;
+	s32 ranging_measurement;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index eed7b015bb20..23d19a6e8d81 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7968,6 +7968,12 @@ enum nl80211_nan_srf_attributes {
  * @NL80211_NAN_MATCH_FUNC_PEER: the peer function
  *	that caused the match. This is a nested attribute.
  *	See &enum nl80211_nan_func_attributes.
+ * @NL80211_NAN_MATCH_RANGING_INDICATION: u8 attribute. Bitmap indicating
+ *	the type of ranging performed: bit 0: continuous ranging,
+ *	bit 1: ingress condition met, bit 2: egress condition met,
+ *	bit 1 and bit 2: both conditions met. Only present when non-zero.
+ * @NL80211_NAN_MATCH_RANGING_MEASUREMENT: s32 attribute. Distance to
+ *	the peer in millimetres measured via FTM.
  *
  * @NUM_NL80211_NAN_MATCH_ATTR: internal
  * @NL80211_NAN_MATCH_ATTR_MAX: highest NAN match attribute
@@ -7976,6 +7982,8 @@ enum nl80211_nan_match_attributes {
 	__NL80211_NAN_MATCH_INVALID,
 	NL80211_NAN_MATCH_FUNC_LOCAL,
 	NL80211_NAN_MATCH_FUNC_PEER,
+	NL80211_NAN_MATCH_RANGING_INDICATION,
+	NL80211_NAN_MATCH_RANGING_MEASUREMENT,
 
 	/* keep last */
 	NUM_NL80211_NAN_MATCH_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 7b55a34a733f..8d4e98fcedab 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18042,6 +18042,17 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 		goto nla_put_failure;
 
 	nla_nest_end(msg, peer_func_attr);
+
+	/* report ranging info only if ranging was indicated */
+	if (match->ranging_indication) {
+		if (nla_put_u8(msg, NL80211_NAN_MATCH_RANGING_INDICATION,
+			       match->ranging_indication))
+			goto nla_put_failure;
+
+		if (nla_put_s32(msg, NL80211_NAN_MATCH_RANGING_MEASUREMENT,
+				match->ranging_measurement))
+			goto nla_put_failure;
+	}
 	nla_nest_end(msg, match_attr);
 	genlmsg_end(msg, hdr);
 
-- 
2.34.1

