Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565389;
	b=X7yYS6btGsBp3Xbvk93+UuCmfn6MR0a4B/Q+InItuLCxbexY7Wy8so1iiWsEJhyzW9aW
	 UOE3g2tdUB7jrPH3zEAItt4yI9XwDIraamsQW1wXy7g2Gie070ITJCICfJFyGZ2uNL0Zj
	 1R9ApMRsAbey1NgGrgWbYNU33uYwvNFfMnVAtg9s05SktL+AriZXMious5g8YCXdlpTeO
	 N2tdTyDGo73H4SE+KXkKNhcK9B79xbNiq3MMG1HrQvra3dAGjphsi/Jgq2Q8OoDJzZhMP
	 EN4y4/8MuwSl/PzZX5yJpICru515BwAm0rWgmPtwUbnwLmyKFjwJdkT+ROLdV3y5ouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
	b=zth55hzdvZeN2RJO/ij6+ZUfd6PHQKk6UwfA4NGrZUguEszoR318YANVccNNNPqwc4Ep
	 o0wjfNCmFlivIN0HeoYXfSwaF3rB2hc9+9lL6zDQCHvElUB0OE1JMRXc1uTxXdRtx9dyu
	 4vmNxxKt6XqpF71pkL6hfBElaJLwkAFN+8zwPz7tjHVXaxxju9ubOCTrNu4cmajBJd22f
	 Ydj3pKDyRHHLTypLeJyojiMQ51l2KuUkMhEIro3OyHZwSMvCCcGKAu1bvqceNiwLpWDwq
	 FF9YKk6KBSMKdm0U5eyCKt+gOBHa9BQV8r5B+PfNrPesT5ZUPjls4A9jtdC1NjQD52Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VNYx7adc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFMunsLx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69BD606A881
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69BD606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VNYx7adc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFMunsLx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uvic3164531
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rlDegUe0qf9
	cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=; b=VNYx7adcqbMPnZ+TomqV9b52GeP
	gKUBuL+wJmwgLM9AAj42LwiYJX6UXyJCYwYmWwUPNkBgkAlyQNrI/cNuyx/ia4jy
	QYvrg0OD/mAGcXHHejUFH8pn3m+0pVEcehXOSCTbw76ykXR7HDMwRLoZRMhH+qDY
	E+lj0f8Fbqxjmda8LVbJoia3/dFdjB9X+r2lUC1D/bkIEdUTsq9/3vDpvJDVsG1e
	hS+uidege7Gk8jYhBPCrSInD7XvlzAWWPB1q56aCkyeWygeycZxwPyxZgVnWtl0g
	PxKsKv03yayLMiQtoM6E+/FeyqLksEFd7vFLJUXbBR5d8Qg4tI4R6xen8Iw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2ms9kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1339178c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565387; x=1795170187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
        b=BFMunsLxAAbacnOeYWgdrbu9BSm7iJ9HnY9HNhGIN+8MRKBBDR6CUrXIB/BmUD8hiA
         KhGxfCbcOuzUX4mh07yb4WnkiETKM2FFsn3EXo8XZExMjYySlp4vF7UimFOBH8gHkBE4
         LMsItVHSJl7MIYrR1SDdZOjeFnT4CyqIHocjcJzE5Lpeh8gaCtlLevAYO86zf8PKpCjQ
         QgAmaxb73XKLwEU1O07XbsnI/anOOQK2gIiplFzo8MBia7ohUwVZXDf0g64GBzoIotXA
         OHNRZ+vH41YZCy4PW4OY6OjWKXxWky/kXv4YP0jWW1MV3uSUYEUVAxJXn166VZie6Ugv
         Heww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565387; x=1795170187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlDegUe0qf9cIFdjIVBhbqr2HWAOkvec52GFwyV99gQ=;
        b=HNHmsCMKl+6xgr2uQBtb+ueRgAa76BY5/dvRh7d8AdcmxZsvdglUJWOe4JUmxzRSOR
         i1UryGE0ks1EZmfH8sdYM7uBoKk0UUj9JdZX8C+PlxRMK2Q6iT05THs0/o+/IKkFaAt+
         ISFVbp76vnKd0832DxBodzxUXufl3DFfG93y2lfjHG6f/DZF530M03TWUmTmFA3uuE0p
         lQ0Vk9pnScJa5BWbHq+UIECOnlBjrR3R1IY1/ipcxRZsyYeBz9Apkd7lXf54nm7Je6dU
         TqyJnMtB0Waw4Vax4vtoVJyQQr7FYlqALJftdEtKCQaX2o5B4VKx/F2OPI5PMD58tEuE
         zOng==
X-Gm-Message-State: APuU4Z/Eh7BgCn363Q4U0Vy3UcJu0PRMgk+3Wg29PKDpazcckaubX/oa
	0MQW9SpTbfxdyatvg+uW/D9ffABBASz7nLYYCgAhPuwSoiKDbtwSv/K790Bu8teG3CV8vufD9Rh
	yOf7ne47vSiAj9A2OMF23zB+SNMbrxBV5kzFD+qA/IyBYZG2VQosE2Ki7XWgWHIFQT2Kr9w==
X-Gm-Gg: AYBFou2spxyc3IUCX5Sphsn/0xt4/5SZGSfyLa7e/G6lQw1c6M75cCurmN122Zl3ErD
	BtMX3xpZJlijsT4ezZaKH++5Pj5UQ9gZU+vZBQqvmLsKjrCiZhQs/XcVNR+dpqlV7EqJWwwQbXn
	OSBAhi0+rBs9tXRn6GixTXtGJbUntPXtv6CfP357rot/N744TAqzJeUTO2XN0FtzaJegAKPTscH
	UK/nFwq+FDunOS/yvVsYR67c0VkEhWn2MaZZHUFxNeqhQGPWOsmZfvL/5Mp0/pByuhsnNkUqKKp
	CXwumxFUVZInGFTFg/lS4cnwK44y657oAYp9rkuJmrhiMzW1w+Ui/znuQSx6sNGfDOVIHHha83I
	yFyo90hXHmnoJYAZqOJqY5aqd6gkyezu/skIfnnz7vTGrI9fXTEua/77GSOl1WwJ3cm2ZeuNuI6
	mM/aQPKMCh2n8=
X-Received: by 2002:a05:701b:4510:20b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b50312f09cmr2211691c88.20.1794565387206;
        Fri, 13 Nov 2026 02:23:07 -0800 (PST)
X-Received: by 2002:a05:701b:4510:20b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b50312f09cmr2211664c88.20.1794565386434;
        Fri, 13 Nov 2026 02:23:06 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:06 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 07/19] wifi: nl80211/cfg80211: add support for discovery-based NAN ranging
Date: Fri, 13 Nov 2026 15:52:16 +0530
Message-Id: <20261113102228.1917973-8-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
References: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Q2k0NJreBTGdScHqTJVQsjwxeRqfvlsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX7/Y5fCAoV1vw
 M0T0wTkX/GoiVuII+l/HLZIfPkTQDK0kgMxvh9HuQPaArsCp8O+SG67bAZhofhMbHh6+5/L+4OK
 SEGNme8NJ8Fc+ZlPLKnbjjFB4bnhGPYCo97K0Lfc0aCvkcahs15Fyfx3kVxt9r2Sa4+KHFFZti+
 ktDiO+YQ6extmGD89pzdJa+onJKarsPGJQ8ZTWW9ikTlzkPR47kF9UtkIAwIbUruFnSGLM1PDtd
 EV/Pius9lEr17huuNGt7UzEkvoFMVnT18lRdkXmHH333AHJmbbOddf0odcVd1cpZyuChvay4BTj
 TWoq2AdGD4DvrTY+aGIFxXOrwfzfkj+ma5lADW1RwovsCpMUS2bERJCzwBFnrcMoNC/Dk/tZ7AZ
 iO+o+QAcp84pEyJ2rPddxP53BOpkTdc8fVGb/nYv5ERrMYTTMbfPYGd0ZOBOINLPhSXioCxa1A3
 pl6chAlN5Igg7QwCvDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX0xe+1vEJ2TWZ
 zDRRsjIOQTeyiFsx5S/3OC/JCPsMrMLQ5JNy0IKDgP19XUJ3llJItjpfgalPeaVxJeZwCYfXVmT
 MkfqsFMLHNXsw8WAY/8yNLMP+jdw95s=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6e50c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qw3kHZD7rQ8DRnGNUL4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Q2k0NJreBTGdScHqTJVQsjwxeRqfvlsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

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

