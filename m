Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285222;
	b=OJGsADBYGfw0cJZHAu9gphrMkgFT7J9qlc3wGRbLchKLixJVf2XwR93XTYRuBTrStoiR
	 ImetnDzHyZPwIrIefbeuywLSHWWVrs+W5X3kq0xfU/YCke4R1gcfOlB9y7Qd7ytyg9XCw
	 HQP0+8gnkSNeKBAtPH8KduvAtHB1ozRvMVvvQLZ3Tt8m9Ycl15rIabG+CpXTCh7KiGmZY
	 RaZD4zXhuocFOhcyUqr4CKqM2kz4i++70eIkRZsbe3xV6FBRu7nxqWZfnvXERwX+jjDFv
	 /GbKmK9JX9JuQJ3FBAmi2ADCXc/HfaY0UkC6Uu3AZg1MKKxqdLduxwWM38t1D4eJGyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Aw3S7q3b96Uld0dC/GQAUzcrtcPb0AVNvI/ABDylOXg=;
	b=yxiS+cVnP/XAWdsiCOCdO7MjqsoNxEV1R9ta78prpnWhC7tEFHYFtqeERgTBcsPIbwmP
	 f2WDnSx8sPyId4+HXM05VZ9TyLXKLIat6CJxlctmcyOcFQZGt3aVzJQW4s+3Ly85Tj14Z
	 43bwbxpvFbEWdx6by6PoMnxlgilwDeNCBl6npBe3COxuLD/ImsvMj45rtSlqjUs+OKO3/
	 XGWqe1tWKKB7NfZKYVticZFQDJvoDgdXu862o6cwjQB588SduC2nG8vHj49ldAPiAqdW8
	 n87SfPhWuC3tPAyNnUi+YfPylwJ5dYju9lSrMetJqrN0In/2QBTeNwjeLMhdcMTSwyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGCPPfBG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvmQgkIk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49817606A331
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49817606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGCPPfBG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FvmQgkIk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A17u3268004
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Aw3S7q3b96U
	ld0dC/GQAUzcrtcPb0AVNvI/ABDylOXg=; b=lGCPPfBGYk0LDfXaKTROoR5SRWh
	BQET6skI+OOCeD53cLcsygZpaKEc6WBiqDFYeWGaecQY4n0WxzNbAeieE6Ju1w5b
	LsVRJ6IcwJXayVMtXtuskQGyu/SE5d6JT7SJJt92U315EZu6t1zhxlXnHnJ5ueKx
	ELVdO99MASXfZGeQwHVrhwtMXauMY5kYT3IcIkGQ1AUxnc7vOkM8yW+QlKa9oRVa
	j36zNa1qV/uG6x49axbAKMSQaYQR6t0VyVOGFK/N3DN/HEsK16N2b4fkbB2nJgFI
	15OwEaEQcugSGX4sgwfgqg2iebzX4fKFfEQl6DZCvtl8mXqAf1WDZu3l6Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qu9b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3800180eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285221; x=1794890021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aw3S7q3b96Uld0dC/GQAUzcrtcPb0AVNvI/ABDylOXg=;
        b=FvmQgkIkllFd5Y4j5+RutOEMnrKQPwytuYmq0IQj2h5lcbsr7JFaRj9DzrW//S85G1
         lfsW0TNjK9BfhpWGwep2jAb2PPsZp3kjb5N+L3WMXhHvbVEzXbLJ9lN0Q7nfvprYkOdN
         LccdO2KO/QGbxBn5eji3mdF4pwynmPr2aBOQAnUnMfqJ9HdyyiyNPn76RYqUr5eukHJE
         y2tGs30nmVltuDAqUWxxXgmXoprpT48yT7IB4N9Z6KdQ7E4rGJBHlbI/pqE1Mo3QmgCD
         RYmE41Y0p7kmRm00bDDULMiRrs0N6EHRYfqaB9YNdXmN5zWcN95qvq80MuInL1TH8kqp
         v6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285221; x=1794890021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aw3S7q3b96Uld0dC/GQAUzcrtcPb0AVNvI/ABDylOXg=;
        b=LHLMS3Mi+lro43+noUuVfd0uxsJHQR5Evi8H3z0qcjisijZ6ML5ljWAArCC1Xzd6cm
         UeqspiH1/4/oW5xXEd2iopOc35+ES3/t4lprbvjmBp4mB/z5ducHp7RFdMM74p39mBKZ
         3hhi7MfcI4FXETdQVtRVzCyh1PWgnnMCXe/6sjrlunXQ5FKOtvHoufHps4ST9rX7tGiU
         MbJ+tRRtRGOGbiN1s5Iy4DgMF4+alJ0175AkXs/b1XGPkC44WZkBwxip2jEwXZvz0ite
         mhZDaJAzh7P0k1MhLc6UDVS5DtZfkTnhOhYw5SlS/7PrT3Hb1EoSOoe4T3KI+QDWMgTo
         CjTA==
X-Gm-Message-State: APuU4Z80Kgx6wCCXxQ7+xDIZnVOU2H4dXzdGFvy2bgldvx2Axnjb95iz
	eI5wOoSHE+zWyDT66J4nPYFnbwZ21evkN7QdEGYT/PGAYhgj9kz6KOdwOVyr2X6BoAkI2bz18K9
	wE7iURvF6DiZVTAIPzUh5x9aphRdbXtSyP8TXAbIsWJZSOExlBitM2fgy9KjMPEtus2r8zw==
X-Gm-Gg: AYBFou1ehLeBkZCsDIsfsbKmnM2Z75HdRLpVxtoRkAOVBKOdwb/DrNYfInvDdly6YTc
	o6mzD4BmSgcVBg1j3xRpqQTH2nWuhdsvsloz1MNodusqaHqjSEb2gZT8KXYL/MIytrbgrdScxIG
	bhBarINTYOmGo5Nixy25Z0sQ1AwrqffAWa9RrGQcSkPm0NnJ6tVz2H6nIxjF3zhH8wLvy+K7AJH
	c8p/kUPi72FG5TAw1SPrHqnIzZeYhsQtrwvggsysmOklVwm7VDCbsZJTOJNIOUXAA+otmF4DCNg
	y7tN8UuPLg6hEBwSWAujfj16KUTyQdCvQMUQFRTSkIJPUX76Hnlc4+Xqnwlk6BDZCyRWra7GHHK
	PZ/2gQaWqZAF+qyyLzoY4TnXGmWYZXS8GwvEEkeoeVJ+aFsEQTkK0xhDLEF2TwPVV456m0Mb8XQ
	dNt2TiD7Siyw==
X-Received: by 2002:a05:7301:150c:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3751f56018cmr1541183eec.23.1794285219093;
        Mon, 09 Nov 2026 20:33:39 -0800 (PST)
X-Received: by 2002:a05:7301:150c:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3751f56018cmr1541146eec.23.1794285218334;
        Mon, 09 Nov 2026 20:33:38 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:37 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 17/19] wifi: nl80211/cfg80211: allow extra NAN attributes in offloaded functions
Date: Tue, 10 Nov 2026 10:02:40 +0530
Message-Id: <20261110043242.2012238-18-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX5A0lX/wt8Qb2
 hkCf//NoFF3kUmfYR5oYrPq/v4rYSmmXx6uKaryv5BIAzsGkzjPWvB5qA3BjcRzV4JbLQrK5LuA
 Qwldod4Jmph4hO/spkTYM0w21mDOOaYvPqy1dW4w7RxmtYFQv9QSImWxLfD1W9n/4I9KC9zcuhO
 Y8HXX7z1+ZBRPPiMypjkA+/En3mlmz8xX7+6x9JkKs6e4t4g1zBkFXqxLoizrdpPjHq8B1ceUM3
 4c3KW6Cr3pktt6HdudtXLLtXDUh12rPNyKZLjvjA5Iz/HK9Fnnxbu9VFb+6REz6xrGAQeKKWuaA
 C8bbwtKq0mF5zTYJfMq/D9aB6Lox/t6j2jQnoobGjPJXJkl2v+538d70DfXi7TDtV81qp9q+a7b
 5MBHqzTnPdUwmhWPECGFK0WcL9vZ3ZaGhoMOwo3hqjOdj/2JypVxve5GvtXv3Lu9AKwbyWKMrVA
 5PD1pjBc5BRIQRReb7A==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af29ea5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-RX98rD8DKRKJ5uf4OcA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: o0VZuzcjjdu3yeyCL1lsFGrossDJi2LY
X-Proofpoint-ORIG-GUID: o0VZuzcjjdu3yeyCL1lsFGrossDJi2LY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX5FhpN4serRrB
 w8VtdGpLGDBjWU2Ej4xbDZ+31Z+y2hRgLRVafbeCFEPgB47+ZTprULBHwImUuGyip7OtvfJMYHc
 W0DsOI27c27jthUAtCzGMpxfErlOvk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

With an offloaded NAN Discovery Engine the device builds and transmits
the Service Discovery Frames, so everything that goes into them has to
be expressed with function attributes. NAN pairing, however, can be
handled in user space: the PASN Authentication frames, the bootstrapping
frames and the Follow-up messages with the Shared Key Descriptor
attribute are built by user space and sent with NL80211_CMD_FRAME. For
pairing verification, the NAN Identity Resolution attribute, which user
space derives from its NAN Identity Key, must also be included in the
Publish and Subscribe messages that the device transmits in the
discovery windows.

Add NL80211_NAN_FUNC_EXTRA_ATTRS to pass a list of complete NAN
attributes that the device appends to the frames of the function. This
keeps pairing, and the NAN Identity Key, in user space.

Validate the attribute framing, bound the length like information
elements, and only accept the attribute if the driver advertises
NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 14 ++++++++
 include/uapi/linux/nl80211.h | 15 +++++++++
 net/wireless/core.c          |  4 +++
 net/wireless/nl80211.c       | 63 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         |  9 ++++--
 net/wireless/util.c          |  1 +
 6 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 1216bc5a183e..75fa387f3a0c 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4641,6 +4641,14 @@ struct cfg80211_nan_func_filter {
  * @chandef: channel definition for FTM ranging.
  * @range_report: if true, a NAN Ranging Report is required after the FTM
  *	session.
+ * @extra_attrs: additional NAN attributes to append to the Service Discovery
+ *	Frames transmitted for this function. It must not contain attributes that
+ *	the device adds itself, such as the Service Descriptor attribute or
+ *	attributes derived from other function fields. Typical uses include the
+ *	NAN Identity Resolution attribute for pairing verification in Publish and
+ *	Subscribe messages. The driver is responsible for ensuring the resulting
+ *	frame fits its supported limits.
+ * @extra_attrs_len: length of @extra_attrs.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4684,6 +4692,8 @@ struct cfg80211_nan_func {
 	bool chandef_valid;
 	struct cfg80211_chan_def chandef;
 	bool range_report;
+	const u8 *extra_attrs;
+	u16 extra_attrs_len;
 };
 
 /**
@@ -6682,6 +6692,9 @@ struct wiphy_radio {
  *	cfg80211_nan_ndp_request(), cfg80211_nan_ndp_status(), and
  *	cfg80211_nan_ndp_terminated(). Secure NDPs require
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS: Driver accepts additional per-function
+ *	NAN attributes when the Discovery Engine is offloaded. This flag cannot
+ *	be used with %WIPHY_NAN_FLAGS_USERSPACE_DE.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
@@ -6689,6 +6702,7 @@ enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
 	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
 	WIPHY_NAN_FLAGS_OFFLOAD_NDP = BIT(4),
+	WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS = BIT(5),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 9a149db238ec..66894f79148b 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7879,6 +7879,15 @@ enum nl80211_nan_func_term_reason {
  *	using top-level attributes like %NL80211_ATTR_WIPHY_FREQ etc.
  * @NL80211_NAN_FUNC_RANGE_REPORT: flag indicating that a NAN Ranging
  *	Report is required after the FTM session.
+ * @NL80211_NAN_FUNC_EXTRA_ATTRS: binary attribute containing additional NAN
+ *	attributes to append to Service Discovery Frames transmitted for this
+ *	function. Each attribute is encoded as a one-octet ID, a two-octet
+ *	little-endian length, and that many body octets. It must not contain
+ *	attributes that the device adds itself, such as the Service Descriptor
+ *	attribute or attributes derived from other function attributes. Typical
+ *	uses include the NAN Identity Resolution attribute for pairing
+ *	verification in Publish and Subscribe messages. Requires
+ *	%NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -7915,6 +7924,7 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_PREAMBLE,
 	NL80211_NAN_FUNC_CHAN,
 	NL80211_NAN_FUNC_RANGE_REPORT,
+	NL80211_NAN_FUNC_EXTRA_ATTRS,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -9458,6 +9468,10 @@ enum nl80211_s1g_short_beacon_attrs {
  *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
  *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
  *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS: flag attribute. The device accepts
+ *	%NL80211_NAN_FUNC_EXTRA_ATTRS for NAN functions when the NAN Discovery
+ *	Engine is offloaded. This capability is not available when
+ *	%NL80211_NAN_CAPA_USERSPACE_DE is set.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9474,6 +9488,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
 	NL80211_NAN_CAPA_OFFLOAD_NDP,
+	NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/core.c b/net/wireless/core.c
index f4153c249599..0d8f9505116e 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -934,6 +934,10 @@ int wiphy_register(struct wiphy *wiphy)
 		     !rdev->ops->add_nan_func || !rdev->ops->del_nan_func ||
 		     !(wiphy->nan_supported_bands & BIT(NL80211_BAND_2GHZ)))))
 		return -EINVAL;
+	if (WARN_ON((wiphy->nan_capa.flags &
+		     WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+		    (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE)))
+		return -EINVAL;
 
 	if (WARN_ON((wiphy->interface_modes & BIT(NL80211_IFTYPE_NAN_DATA)) &&
 		    (!wiphy->nan_capa.phy.ht.ht_supported || wiphy->n_radio > 1)))
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 15c2294d4be6..e1dac3d912ff 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -460,6 +460,42 @@ static int validate_nan_pmk(const struct nlattr *attr,
 	return 0;
 }
 
+static int validate_nan_func_extra_attrs(const struct nlattr *attr,
+					 struct netlink_ext_ack *extack)
+{
+	const u8 *data = nla_data(attr);
+	unsigned int len = nla_len(attr);
+	unsigned int pos = 0;
+
+	if (!len) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "NAN function extra attributes must not be empty");
+		return -EINVAL;
+	}
+
+	while (pos < len) {
+		u16 attr_len;
+
+		if (len - pos < 3) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute has a truncated header");
+			return -EINVAL;
+		}
+
+		attr_len = get_unaligned_le16(data + pos + 1);
+		pos += 3;
+		if (attr_len > len - pos) {
+			NL_SET_ERR_MSG_ATTR(extack, attr,
+					    "NAN function extra attribute length exceeds remaining data");
+			return -EINVAL;
+		}
+
+		pos += attr_len;
+	}
+
+	return 0;
+}
+
 static int validate_nan_avail_blob(const struct nlattr *attr,
 				   struct netlink_ext_ack *extack)
 {
@@ -1418,6 +1454,10 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 				 NL80211_PREAMBLE_HE),
 	[NL80211_NAN_FUNC_CHAN] = NLA_POLICY_NESTED(nl80211_policy),
 	[NL80211_NAN_FUNC_RANGE_REPORT] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_EXTRA_ATTRS] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY,
+				       validate_nan_func_extra_attrs,
+				       IEEE80211_MAX_DATA_LEN),
 };
 
 /* policy for Service Response Filter attributes */
@@ -3235,6 +3275,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -17721,6 +17765,25 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 	}
 
+	if (tb[NL80211_NAN_FUNC_EXTRA_ATTRS]) {
+		if (!(wdev->wiphy->nan_capa.flags &
+		      WIPHY_NAN_FLAGS_FUNC_EXTRA_ATTRS)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Extra NAN function attributes are not supported");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		func->extra_attrs_len = nla_len(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]);
+		func->extra_attrs =
+			kmemdup(nla_data(tb[NL80211_NAN_FUNC_EXTRA_ATTRS]),
+				func->extra_attrs_len, GFP_KERNEL);
+		if (!func->extra_attrs) {
+			err = -ENOMEM;
+			goto out;
+		}
+	}
+
 	func->data_path_required =
 		nla_get_flag(tb[NL80211_NAN_FUNC_DATA_PATH_REQUIRED]);
 	func->security_required =
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 9ea561402b6c..e893dbbe66fe 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2448,16 +2448,19 @@ TRACE_EVENT(rdev_add_nan_func,
 		WDEV_ENTRY
 		__field(u8, func_type)
 		__field(u64, cookie)
+		__field(u16, extra_attrs_len)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
 		__entry->func_type = func->type;
-		__entry->cookie = func->cookie
+		__entry->cookie = func->cookie;
+		__entry->extra_attrs_len = func->extra_attrs_len;
 	),
-	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT ", type=%u, cookie=%llu",
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", type=%u, cookie=%llu, extra_attrs_len=%u",
 		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->func_type,
-		  __entry->cookie)
+		  __entry->cookie, __entry->extra_attrs_len)
 );
 
 TRACE_EVENT(rdev_del_nan_func,
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 980b16c72d4f..4e1cbe50af1e 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2876,6 +2876,7 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f)
 		return;
 
 	kfree(f->serv_spec_info);
+	kfree(f->extra_attrs);
 	kfree(f->srf_bf);
 	kfree(f->srf_macs);
 	kfree(f->csids);
-- 
2.34.1

