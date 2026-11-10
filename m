Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285199;
	b=o4GlhoSjl+Ed3BAclR6Q3URu75eCUpfTvnboX7ZERk6axoZianPbREi2pHE2jcpte9My
	 tPT5ejWYNjOEEqQyaAIMPQbXUwcpBHw8BZW+4YHeW3m8HznhO1v3Ngtk/cLZX/NqvXpE2
	 bvLuPGhAPAh7Ht48je6IzVXtmmwfXqEser4I8D13GTsYxTf5OCySPPf7WQccnJN4djV8K
	 yDfE73oeqGV/DUlaE/LUGwYnRE4UclhMQARzc+xoz/afngg+shQsM5yv99gKbXq9oKke5
	 aGGz3EBZs8I4zrLokDgCAAeJhrQXRmxqVLvijavM5N2ytaWDf1Xk05IEY0FjA67tf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tM8v0sQq2VX6B+dudeEFwT2WtYaCKwqyBKg2CaMitI8=;
	b=1vrh2j5yTWJKB8JlnEIywQziEasVWdkBL41UecDOSjcwNj4fIJ/d4yPY1Eb/3V63JxyC
	 Zsy/u0SEEV1ZKcp+c8MWgDw4P/DDpogw/J4gJ+VRZxNEpoXDD//lMYEL2WQ3mJSPCCJEZ
	 vG0Pv5FA0rlYl7RTaeuKCUJpvJzkrUzBFALcoh/P25ytcKOFODN0v1p2D6c3+dC/yoR0K
	 NQm9Kj8fWelyOfCwp5PCedobdxo9N/5xtrJ4ChVQDcTb1p3VHY3x2OavRzSH3XkqgJ3ZA
	 IkLKnruBFj5LL1zTpCE46R3DvonQN9vOfkotG36h1JSQeZ14X4zuvYxV/JLzSFBmgHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="e4n/eDNy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+G5P7dv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212C606A8B6
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3212C606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4n/eDNy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+G5P7dv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A7pM1957688
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tM8v0sQq2VX
	6B+dudeEFwT2WtYaCKwqyBKg2CaMitI8=; b=e4n/eDNyaAmsn9do6O/WF8DGQKQ
	+5PjAUfwK6I0EWdT4qn17JFZ80ilXRMRfqbN+GXlVfVYdEr4+8Tdc/NyT6TIQERY
	TCCRAxn1R7pXmkf3X+Q8QNxe8yAhA63Av5+fXAKiLQg2iAoIr9hDqv0hDSkqmtuq
	ac3eHBkKZvYMj41KZK98qGimx1ss47Rr33HTpSGzN0SYq2iq+ZtjutofTcT4oSeH
	eNIynqBSiDY8QYC49u0QW6F9IbuzOa3C0nI+VlAYCfvYsXt8HBGHzYUzW6RR1bVq
	iPWO5HcCWSVkBLYjN1hJFkRSvClVv8wgQXIsoZ6WAv/0jdq9N438iW1FMmQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkk9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2084988eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285197; x=1794889997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM8v0sQq2VX6B+dudeEFwT2WtYaCKwqyBKg2CaMitI8=;
        b=W+G5P7dvwMPVlYw0seb0HvQ2BtUQpfCilArLwidZSkBphqP1C1qiPJl9qH3Kv0fXeQ
         uHOgsfGhAJrm8jDHedoxrmsUvhEO8jvoHr5kGF7n0+ifSCIO90AOyb46EZN5pgODT1+K
         +2dHkA9Ht1Tg+qMUMTU/j9b3taj8jNdckkPJbw1TRfh2wCXRUahcYdrEFjVLHvuL42R8
         CfxelCBOvjpQ8IELRD2Mcdm2DZLkfG07IPkqth3xxj9mE0geyzGpvBZQp237XKIhGynq
         Uhe0D+56/XG0jbovPW8EYr7y2N+T/bIUxn0bdg8otxyaq2fBXbz/n+U3YnCQT635cvW4
         Egnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285197; x=1794889997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tM8v0sQq2VX6B+dudeEFwT2WtYaCKwqyBKg2CaMitI8=;
        b=zwOawtqX6TOOwMinHbN2IBSQ+D+EStfmqW0CuOIjHsBN2kCvoY3vyQbCsxwIZehjLw
         AlJdv0l9Qm072gK7wzMpdM9xxIPcVcKts3cBGvVT9FPLYIsivSvsJsfvDY+Hi3UCZQlM
         U9GCdSIfge/ukOvF+qAxDsiqwtzwmcn2rZzyq/8cvP/oC1J/ViZTnJQE3BEMLv4ACXcb
         bK/G/xeP+uAftlNyDu4YVINry1iVAoV/C/Ew8s61Gxj2bd/7RwnwLOGpzI/O8/UwAZsy
         o63goCK+JXgdaB+DXmB5HfBMC2/kaZc+zGPLOWPYRsyP8BvFO9W9NZAVR3P9TDsZTH2J
         QtJg==
X-Gm-Message-State: APuU4Z80di0V3yrs/w5Uppo3qrCkLqcZh8zR8XJgzsi9qB/mUlqmTtWu
	c72f2QX2xjzCOcCwJnjQj2EDUgbBpyTnIZ92hHK5j+vloTd8Jz2O48ChDZrRzQ4LOiKC/Pr33c+
	HM7vTdpUUPyOSs8w2Lw3Vt0cRMHZkE9Po2xYf6XnNLU5yS8acCO+IC+OsQG4KQ4j86qEoiw==
X-Gm-Gg: AYBFou0x5uuF9XXHx4mmaL3Cr4Hkesw3eCJxMObpQi+ROq236tUzBW3Z65o2QvRN3aI
	lHiAiMP9fBb1gIQUt/2vE8vXlv8ZvCLV9yEEr5iTIOJqZmTHF1xfhoilnCQsQUjchs6tWRaBqKA
	ULDIEjiQVJoznjqKRGogJO8slR0g0YDqRMolY4UOxhHPYLKKifCdWPBEYeE9PuEg79eDtoasWJL
	20A5T1PyASR4oc2O4X/S2iAFk5W/yAYtTGvz54FUkceUvVON9A+YZifRV1sIlpqzP85PBiQPvKf
	vYbmQEXi1jbuVc4vbcYq0eHUrYDkDWtOrJ4mc4BllXY4SmTMWSME8X2iVbhPvRNfdDCqUTW6sN0
	RE3IH2HNww3tnJzIFaM1pQs3QD+PuD0LUHWFTX8249/t0fy1q5yFzu6B2rDJStXV/UCIFK25u4s
	XKQwJefywwgg==
X-Received: by 2002:a05:7301:29ad:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-3751fb34369mr1971181eec.26.1794285195975;
        Mon, 09 Nov 2026 20:33:15 -0800 (PST)
X-Received: by 2002:a05:7301:29ad:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-3751fb34369mr1971134eec.26.1794285195067;
        Mon, 09 Nov 2026 20:33:15 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:14 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 07/19] wifi: nl80211/cfg80211: add support for discovery-based NAN ranging
Date: Tue, 10 Nov 2026 10:02:30 +0530
Message-Id: <20261110043242.2012238-8-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXydXUxfrVHvzc
 qBFEq8gCtbkltK/eacfYkZ5jNfWExJqBlQSLMgIqxYSZN2Mr6ysPNdr8u9iwxtVuHJ+Z8utVniG
 WVSzi+nrqISgXTED81ObvT6ePC297AE=
X-Proofpoint-GUID: OSoykQ4-qAQfC6FSHq-lTorMjoETGZHi
X-Proofpoint-ORIG-GUID: OSoykQ4-qAQfC6FSHq-lTorMjoETGZHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX+Q23czXfoUXq
 HhF8QV14/HftyruQJawdWT/FOw+Wo0WJ6xU2BxTi/D2MhZzYOA6HVz8hbxtEQ7SrVRSxN03Avsk
 CWabqMG0q6MaMJkORyrgyraoxm0HpOGTKxFc8ihJHJf9zvvZbQtSvK7oHoUkvlpJ7BbjsehpTYl
 ZZxheqiMsBSNnzi0Uc/vroihLMvc9zZTAXtSTIHBch7yifr1uhfZA0sRT2QmsNVJgvqviTWfTiy
 WonT5N+Q1jJc0hQRUmMv/bl2/P7CU8jz9Y0ufBZx6KIYKdwTW/0P81dHVi9fIQIJG0WpmbSRwRJ
 Y308Tv8erRUqzM1L+C/MiVdHM2HlSJWaMqcEGrlfU0M+uxnQDlpUg3MBnsNd+RedTLL3SHupgMo
 vvGLbBJT8DA+HcOYmoduwZU2aG8By6NWMiYxLd7Ed2OepizTGVlWz+oT9kW4lvUrLxAHf846xt9
 4u+j4q/sNPp7awBVLgw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af29e8d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6ZyvblBqhkpgJAFtzp0A:9 a=PxkB5W3o20Ba91AHUih5:22
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
index 82cd89766ee4..facd5d8bc5e1 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4411,6 +4411,20 @@ struct cfg80211_nan_func_filter {
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
@@ -4445,6 +4459,15 @@ struct cfg80211_nan_func {
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
index f4d7e259a777..e71db9de3ef2 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7777,6 +7777,23 @@ enum nl80211_nan_func_term_reason {
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
@@ -7805,6 +7822,14 @@ enum nl80211_nan_func_attributes {
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
index c64b918f2748..f86d593a1baf 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1377,6 +1377,16 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
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
@@ -17708,6 +17718,97 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
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

