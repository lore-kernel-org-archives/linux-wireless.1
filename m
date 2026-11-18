Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983793;
	b=5UAXwk/g/ICiYdnBhKX868ycf2ME9ztJFCbrRhktdqKep2x+elogRprqa3neGNg9ruB5
	 vCn0VOw6DFvskya5nd7PA/V0+39/alCN8WhM7i3XtkLzSqLxbwisFlEGsh+r6au4cOAUT
	 4Wgns0gUIwwOie4U9oLqNbOrmfTIcujfBqolV4Z/xC1EUkG3KmRWx3+xxn0H7IPT3h017
	 vLl+dIuij+6WN63RuntO9Xa2Qlz6wLa4ibok3+wo7RHy1NtfDVBJnNVa3dcpVq9P7XA0K
	 FZW9DFcPYti+eRd+rKAn/3C9nTXOA3YMGWpYWEa+QDtMeIX/nkI9pxU8tV83B54j37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
	b=JVGBfkEz28GeyDRnw8R7tSZycO0Hw4Nv62QFdO8SstwZEo26CtUFTJpoazJnrzAojAHU
	 uavUUib56DNYViScPjWD25PqRjw2Wu6rVYMmzlwsZMhncxew4OKCO4jhMp7dtRSKCyWFi
	 OjvtW3csAgmtdC4wQlGXeWE22Zo8Pq7Q+xkg9N71Xf/2kH+KCdsTRld8G4n5kgghexORs
	 6mWZN/4Nu8CyULs9ceuV2V14k+OT6OF7kvuabYgtSuM7kz67MyWIK9qHdPWI96iUmtIsG
	 ejoPHXdttaLhbY8uK1hg3Pjuqqe8gpQzjHYzsDotFJVsOi/ZTND2wnL6RDFm6pZBE8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsd6ySBC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3BlIqwY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F99D606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F99D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsd6ySBC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O3BlIqwY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uq0e2383042
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rlDegUe0qf9
	cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=; b=nsd6ySBCrBfIldon0M5ogXBfiHF
	PvZytu21OgA07/lMHu9CYY2IZeoltYOarl+4aaDfpFw++9JDP4P3OM21wlnOOMK/
	mQP4lPay281XSIfGHZu0Bz4XMT73ILP4AIwitGWi4/dyVYdpIeeiX9Kwx4Oz6wVx
	bI94+uICFTccvcdrdxTVnbS1oWa7K9k1lZPxa88ad0nyHvgOsrJ9vkVXwS2wXnZV
	TmPf2dXCVU1dqOiqLZsukWst9rtf1xOIDhF8Z76H6Yj+GnwGHPlmo+49ClGEjgyX
	Ysl9CEET/NPQaoVkpUEWCxYykMLftgYQGJW0ve85Hf/yL0Nh4AdMe1icwTA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasmea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2613327eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983792; x=1795588592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
        b=O3BlIqwY7coe+lK1mjWs3rQI1TZdqeYPIKR2z6kVXwwSpy9F8DgGEJJ7A9WR8i4X4g
         mNYS7vTrxto+3SFGY+vbzMpng+V0yQhT03St5fp83LN63nEUC+O01iAN+DIx1ifSSzvg
         OdHYle1rr4QBxyQ8oC2b4IOF/e1eycGGy9gAjmGoL8U9bVrPBIfabsoSILPS6jChMvZX
         j+4Haq53OmU1mgdVbs5CU5j6VQyjKB+KMl+E3/2wMXcvrUTN8yeGeR+Uy2GhjTztjQmN
         M1bdCTmBvfrXxPI3gycdFHAy4QhObc0VxJZ9mr4bO1YNGMX2FuRZrkgHI7uvUDTGVqWc
         rIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983792; x=1795588592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
        b=al4koWKuFLapos+xz5sD/1gmgpi2PodSPeCpES7ENp3BKhlhjyx2vzdo8hWhyZ4Fa7
         8C3yrshKs/5CsgFtossp8uZaJcmAVg5duAdz2FZRcFnnb2Qp+S8JMVduaHOVeLgTbuHQ
         ewLUGp2so3zFv6qoGSGULF9z2rr/tigJTtuudcnFyzAWpyf6vnjIwnpeXp2NFPrqUUix
         vP/GW1DCED5WZx3FXEk+hhsttKhxfpyMphQDthdpv/JOKIgYkhjbOduU5Ho/l3IecJDh
         ijnkKme0cPw83I9C6lB0oQPX3dKcZHP5eEm7pry/tTMzriEocK92oErqL/1fEjHu8L8s
         M/2A==
X-Gm-Message-State: APuU4Z9XOTFnbibzH8CUKZcbq3hNI3IE7Clo/r8YVpRFKWhzE1ncQvN3
	J+4rY5S3jFADAhOsxdac2FaVjvjN8+UDxVmE/M7komH32gjt8wwHi65cDGuafKaRIrEljMwo0Bh
	9GvYP6cq+bHm2JBDRXruPDr+GWnoLxEbJ8DHI4M0q/AuhneuLKIk+jfj+Fgdohgndx17n8Is4vC
	J/cg==
X-Gm-Gg: AZFdTZc2RJ60rn7k6+Cy1lQQ+x/0lbZbrc0sRgqgfJHMeytPtfT7g9vas6/kDhYzdya
	OWq/TfZODoxNNKczFjud816J2PvXF2K6x6s5rEhkhFA4AjI3Kvu5w379wnRCensbAUn6NqJuxOc
	MXaKQfi0cOWbJ9QW8mnYPR+oTz5pNq5l4/xPFsrymPzncHOAs7aMM5/wzcgvEqq794v9fU8s3KB
	rVGdG6yMdJLmGsKdmRE5wvnKUQDtsEIlEPLX/STcf8eJ8MXniPrUTnnaJQgGWDN+FlmdiVIATWv
	T3VoZxizFdljJK/mmKlvbaW3S4iJQwHe3rYhx9GLNq6XYkVk1Q8xD46yK2YmyeaEvPM50Pc5MbX
	IUXnlsUqwHVUQBHDJBVrsKGbgI6zM/GaLFyE3tgWvZyPRnu5Pe3QXGrWFIkYd3mTcA0MMF4e+IU
	HclB1FiNTXiA==
X-Received: by 2002:a05:7300:601f:b0:369:9062:c392 with SMTP id 5a478bee46e88-382814281c8mr1542312eec.37.1794983791865;
        Tue, 17 Nov 2026 22:36:31 -0800 (PST)
X-Received: by 2002:a05:7300:601f:b0:369:9062:c392 with SMTP id 5a478bee46e88-382814281c8mr1542301eec.37.1794983791080;
        Tue, 17 Nov 2026 22:36:31 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:30 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 07/19] wifi: nl80211/cfg80211: add support for discovery-based NAN ranging
Date: Wed, 18 Nov 2026 12:05:42 +0530
Message-Id: <20261118063554.2260397-8-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd4770 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qw3kHZD7rQ8DRnGNUL4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: dcegpVVLPTaBcX2l21UOlLSkAXdnalGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX+sSVm8FWQYYS
 RUPPBoB8uGSp9Tu0FM+iOG1W3MJw/PAqR9NkJw9iVAm8evZhOQScHvJ3fpS/dtgid6cO91YnJEM
 d5urQGkXeU/G9mVEaynNoYEpOdkqENcL+EYphV3iYoG1uwjFdlCYUhdfjf0cMBRXsCbL3nVBvLV
 qEa5Vkx7wATdroaRmGL5H4Y97TVx+mHfp21v3Pog4UU7/nsmZJY4TVRHZfPNRqwFluLAl7/MxKM
 4G6EP6P5z51iYOBhirJ4z7HTQW7UcMSewAXqMlSL2iUsfYFVNR92KEamJYn/HI8GpJDFyeAztMh
 r7bvIE0EAdAUB184sf1S1+jU6jD56LBRfVHQ3pcFs+ANqYLkk06LydKvLu+ZYtKSHoW94eWS9y9
 SZVKXwaQ50tSrJX33t0h88qH2hkVJXQBBLCotlJA2d5qCgSFQlfxOsQhI44fIOUWM17Jm+Vxebp
 M9QV3aLhGDNIUCglqcA==
X-Proofpoint-ORIG-GUID: dcegpVVLPTaBcX2l21UOlLSkAXdnalGt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfXwAdRJxkZlGvS
 gAq1x9wKCqXLunu6w6Vxp0t9yrGTmU9GP3sIms68xN1wR4Y7Vb6GXLaOxpZ+jwGA0gg13rsTSBC
 E4ha8zqIv8qz4szQPFtho3322K+4LIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Extend the NAN function configuration with ranging parameters such as
the ranging interval, geofence thresholds, FTM parameters, channel, and
range report request. Add the RANGING_REQUIRED flag to express the SDEA
ranging intent for the service.

Require the device to advertise NAN ranging offload and NAN FTM support
when RANGING_REQUIRED is set. Reject ranging parameters without that
flag so the driver and firmware receive an unambiguous ranging request.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  23 ++++++++
 include/uapi/linux/nl80211.h |  25 +++++++++
 net/wireless/nl80211.c       | 101 +++++++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 084e23d2391a..6bb840a1aef3 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4457,6 +4457,20 @@ struct cfg80211_nan_func_filter {
  * @num_csids: number of entries in @csids.
  * @nd_pmk: pointer to the pre-shared NAN Data Path PMK (ND-PMK).
  * @nd_pmk_len: length of @nd_pmk in bytes; depends on the cipher suite.
+ * @ranging_required: if true, the SDEA Ranging Required bit is set.
+ * @ranging_interval: interval in milliseconds between two consecutive
+ *	ranging measurements, or 0 if not specified.
+ * @ingress_distance: inner geofence threshold in millimetres, or 0 if
+ *	not specified.
+ * @egress_distance: outer geofence threshold in millimetres, or 0 if
+ *	not specified.
+ * @ftms_per_burst: number of FTM frames per burst, or 0 if not specified.
+ * @preamble: PHY preamble for FTM frames, see &enum nl80211_preamble,
+ *	or %NL80211_PREAMBLE_LEGACY if not specified.
+ * @chandef_valid: if true, @chandef is valid.
+ * @chandef: channel definition for FTM ranging.
+ * @range_report: if true, a NAN Ranging Report is required after the FTM
+ *	session.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4491,6 +4505,15 @@ struct cfg80211_nan_func {
 	u8 num_csids;
 	const u8 *nd_pmk;
 	u8 nd_pmk_len;
+	bool ranging_required;
+	u32 ranging_interval;
+	u32 ingress_distance;
+	u32 egress_distance;
+	u8 ftms_per_burst;
+	enum nl80211_preamble preamble;
+	bool chandef_valid;
+	struct cfg80211_chan_def chandef;
+	bool range_report;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 849e6c19d122..eed7b015bb20 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7873,6 +7873,23 @@ enum nl80211_nan_func_term_reason {
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NL80211_NAN_FUNC_ND_PMK: pre-shared NAN Data Path PMK (ND-PMK); its length
  *	depends on the cipher suite. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_RANGING_REQUIRED: flag attribute. Sets the SDEA "Ranging
+ *	Required" bit. Requires %NL80211_NAN_CAPA_OFFLOAD_RANGING and NAN FTM
+ *	support, indicated by %NL80211_PMSR_FTM_TYPE_CAPA_ATTR_NAN_SUPPORT.
+ * @NL80211_NAN_FUNC_RANGING_INTERVAL: u32 attribute. Interval in
+ *	milliseconds between two consecutive ranging measurements.
+ * @NL80211_NAN_FUNC_INGRESS_DISTANCE: u32 attribute. Inner geofence
+ *	threshold in millimetres.
+ * @NL80211_NAN_FUNC_EGRESS_DISTANCE: u32 attribute. Outer geofence
+ *	threshold in millimetres.
+ * @NL80211_NAN_FUNC_FTMS_PER_BURST: u8 attribute. Number of FTM
+ *	frames per burst.
+ * @NL80211_NAN_FUNC_PREAMBLE: u32 attribute. PHY preamble type for
+ *	FTM frames (see &enum nl80211_preamble).
+ * @NL80211_NAN_FUNC_CHAN: channel definition for FTM ranging, nested,
+ *	using top-level attributes like %NL80211_ATTR_WIPHY_FREQ etc.
+ * @NL80211_NAN_FUNC_RANGE_REPORT: flag indicating that a NAN Ranging
+ *	Report is required after the FTM session.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -7901,6 +7918,14 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS,
 	NL80211_NAN_FUNC_CSIDS,
 	NL80211_NAN_FUNC_ND_PMK,
+	NL80211_NAN_FUNC_RANGING_REQUIRED,
+	NL80211_NAN_FUNC_RANGING_INTERVAL,
+	NL80211_NAN_FUNC_INGRESS_DISTANCE,
+	NL80211_NAN_FUNC_EGRESS_DISTANCE,
+	NL80211_NAN_FUNC_FTMS_PER_BURST,
+	NL80211_NAN_FUNC_PREAMBLE,
+	NL80211_NAN_FUNC_CHAN,
+	NL80211_NAN_FUNC_RANGE_REPORT,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index eb5ca1d1aff0..7b55a34a733f 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1396,6 +1396,16 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 	[NL80211_NAN_FUNC_ND_PMK] =
 		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_pmk,
 				       WLAN_PMK_LEN_SUITE_B_192),
+	[NL80211_NAN_FUNC_RANGING_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_RANGING_INTERVAL] = { .type = NLA_U32 },
+	[NL80211_NAN_FUNC_INGRESS_DISTANCE] = { .type = NLA_U32 },
+	[NL80211_NAN_FUNC_EGRESS_DISTANCE] = { .type = NLA_U32 },
+	[NL80211_NAN_FUNC_FTMS_PER_BURST] = NLA_POLICY_MAX(NLA_U8, 31),
+	[NL80211_NAN_FUNC_PREAMBLE] =
+		NLA_POLICY_RANGE(NLA_U32, NL80211_PREAMBLE_LEGACY,
+				 NL80211_PREAMBLE_HE),
+	[NL80211_NAN_FUNC_CHAN] = NLA_POLICY_NESTED(nl80211_policy),
+	[NL80211_NAN_FUNC_RANGE_REPORT] = { .type = NLA_FLAG },
 };
 
 /* policy for Service Response Filter attributes */
@@ -17727,6 +17737,97 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 		}
 	}
 
+	func->ranging_required =
+		nla_get_flag(tb[NL80211_NAN_FUNC_RANGING_REQUIRED]);
+
+	if (!func->ranging_required &&
+	    (tb[NL80211_NAN_FUNC_RANGING_INTERVAL] ||
+	     tb[NL80211_NAN_FUNC_INGRESS_DISTANCE] ||
+	     tb[NL80211_NAN_FUNC_EGRESS_DISTANCE] ||
+	     tb[NL80211_NAN_FUNC_FTMS_PER_BURST] ||
+	     tb[NL80211_NAN_FUNC_PREAMBLE] ||
+	     tb[NL80211_NAN_FUNC_CHAN] ||
+	     tb[NL80211_NAN_FUNC_RANGE_REPORT])) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN ranging parameters require RANGING_REQUIRED");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (func->ranging_required) {
+		const struct cfg80211_pmsr_capabilities *pmsr_capa =
+			rdev->wiphy.pmsr_capa;
+
+		if (!(wdev->wiphy->nan_capa.flags &
+		      WIPHY_NAN_FLAGS_OFFLOAD_RANGING) ||
+		    !pmsr_capa || !pmsr_capa->ftm.supported ||
+		    !pmsr_capa->ftm.type.nan_support) {
+			NL_SET_ERR_MSG(info->extack,
+				       "NAN ranging not supported by device");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		if (tb[NL80211_NAN_FUNC_RANGING_INTERVAL])
+			func->ranging_interval =
+				nla_get_u32(tb[NL80211_NAN_FUNC_RANGING_INTERVAL]);
+
+		if (tb[NL80211_NAN_FUNC_INGRESS_DISTANCE])
+			func->ingress_distance =
+				nla_get_u32(tb[NL80211_NAN_FUNC_INGRESS_DISTANCE]);
+
+		if (tb[NL80211_NAN_FUNC_EGRESS_DISTANCE])
+			func->egress_distance =
+				nla_get_u32(tb[NL80211_NAN_FUNC_EGRESS_DISTANCE]);
+
+		if (tb[NL80211_NAN_FUNC_FTMS_PER_BURST]) {
+			func->ftms_per_burst =
+				nla_get_u8(tb[NL80211_NAN_FUNC_FTMS_PER_BURST]);
+			if (pmsr_capa->ftm.max_ftms_per_burst &&
+			    func->ftms_per_burst > pmsr_capa->ftm.max_ftms_per_burst) {
+				NL_SET_ERR_MSG_ATTR(info->extack,
+						    tb[NL80211_NAN_FUNC_FTMS_PER_BURST],
+						    "NAN FTMs per burst exceeds device limit");
+				err = -EINVAL;
+				goto out;
+			}
+		}
+
+		if (tb[NL80211_NAN_FUNC_PREAMBLE]) {
+			func->preamble =
+				nla_get_u32(tb[NL80211_NAN_FUNC_PREAMBLE]);
+			if (!(pmsr_capa->ftm.preambles & BIT(func->preamble))) {
+				NL_SET_ERR_MSG_ATTR(info->extack,
+						    tb[NL80211_NAN_FUNC_PREAMBLE],
+						    "NAN ranging: unsupported preamble");
+				err = -EINVAL;
+				goto out;
+			}
+		}
+
+		if (tb[NL80211_NAN_FUNC_CHAN]) {
+			/* Reuse info->attrs for chandef parsing; the original contents
+			 * are no longer needed.
+			 */
+			memset(info->attrs, 0,
+			       sizeof(*info->attrs) * (NL80211_ATTR_MAX + 1));
+			err = nla_parse_nested(info->attrs, NL80211_ATTR_MAX,
+					       tb[NL80211_NAN_FUNC_CHAN],
+					       nl80211_policy, info->extack);
+			if (err)
+				goto out;
+			err = nl80211_parse_chandef(rdev, info->extack,
+						    info->attrs,
+						    &func->chandef, false);
+			if (err)
+				goto out;
+			func->chandef_valid = true;
+		}
+
+		func->range_report =
+			nla_get_flag(tb[NL80211_NAN_FUNC_RANGE_REPORT]);
+	}
+
 	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!msg) {
 		err = -ENOMEM;
-- 
2.34.1

