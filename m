Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285189;
	b=3CUww5KkwKP8N5Fe3TIAW9vdSCcDpXLqV3fM2l3mj1RijtvwTsuuaH50uFib17OGGKoJ
	 WRcbTI5NfRhg5f9IueU9xmX+A6qFxcisSO/1iY9N7GAyMXuq74gVwmPtyudUAQ55k7S3c
	 E7skhME4K9UsXUvUA0+9C+Gv3G7O2RcWCs8T0NNkcyhHCEmeoh/jBvBbbSZt8LpeQm6gA
	 XD4DTdRAqWoUZxlU1ciI/3s5W4Pg2AOHLHUpdRdksIuLowOfCrmFhvgOJWBIVdPmw1FKS
	 OqlPwBrX6D/oZ2fc0sWoyn+0g7zqtQKk4V35hJMqlGQ8tm7XlCPiRAnI34hnGX41/RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JIplE7IHUEyps/VBRdy/jpxIlAIg2nCCBrg6WcyrYI8=;
	b=IvzeOPubBsbrpWxLNMAiW1OtVe0oLW8JOwaAtAACgzrMaxZOQwC6wvDDT5cSC9LsNvg1
	 YSdnSm2/LKYE1/R0YrQZBHj7Tkor85ZoY8CNSZcFnGViYLFgiEQ7omrSBAcUqXMUyaaSx
	 +PBKyrBSLlnT1I4tSAkAZYuiQSllLLp/zv9N4bjphCrLX6D/CAPTnzgmmWSsSKUZM1YqJ
	 Wsyr91DqSmSbPjoPCtcLYTg9fIDR4iOlCmuDzqqSlq5fs+ch7T4RDte4DMEFOSEK7cAcm
	 Vo6iTm7ksPAJaO35+cmbVnkr+Z1/6GxbjqESD/YpQ5vJ7d6Yc2sy0k79t3gxzKEsddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4dDOAA1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdMxGRnK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35A606A88C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E35A606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4dDOAA1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdMxGRnK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5XL1957623
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JIplE7IHUEy
	ps/VBRdy/jpxIlAIg2nCCBrg6WcyrYI8=; b=H4dDOAA1zBJ2txiqRa7m1biTB7F
	7OquETeMIn8FNIgWh1iwLW7StED0BkthteB11LB84deGnOmdzpMNb2zIOFEKEvyP
	4CMa0uSsWkAa9/KGd3+azWEwuebc9T2FaxjdxF7S99g4ImfHze4r32AAsdkp7MRp
	pXk2ADgMUCI2sNNoPg9MXNz/TkPgL4k7llPMJulENhFIkhgPMjnwI+bQNjveTjFF
	U2/K/nD2DZP2djhfXJX6VK9ICPjP4+2KNxCC02DM5GpqntCXxqulXaboqXbe3mIp
	ulAre8DvOUy00fE/GKjKI7TqnYi+Ww2eS3SGt5k4ndFbsAVly0EXOh2JLBQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkk8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3799583eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285185; x=1794889985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIplE7IHUEyps/VBRdy/jpxIlAIg2nCCBrg6WcyrYI8=;
        b=PdMxGRnKs7gR9Tag0Vf3rkrP5AcBe9737pMmyMYUFNh7PUOzu95z+6JaT4CEhc+hgO
         R/SFNIDJ1JEtBqbitXaStHuV8CEHTiWm/ywzIvcUBOUhI+U2owpTT/1HXI5jGO2A37Kt
         cRqxv2btNTJS6taylEKakxbXKHl5xbd0CGgknCb5meiYYzN3qFP2fLERuV0Jym+1aslo
         K8FtB8CztplWICkbKC9p0SgZnxpSEwk+Hz40uBToeB6g1oyUoDS8AHT51RkSDtJdOtqf
         ITZ7UGeVxNoa+ZegLjy/6Hr3vu+7GBgAQ3PfJTRJyo/ppbbW7cYV4epBRr4AUvz1awyj
         DYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285185; x=1794889985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIplE7IHUEyps/VBRdy/jpxIlAIg2nCCBrg6WcyrYI8=;
        b=lB106IXdf6E4oizknsL9+6m3SrdrUeQXiSnR0SPPk/oBg6lQqHVJ0t4l3myR6k2GYh
         JvLpwdbajksI75+JBtkxAif+htusP+M/CVLcknTEE9AJ3Qo0W3hxAsTO74jLWUAgIDTa
         FPcdnDxI7gcDI2Hd5HIuWFAOdZ9fmAsJDkEkuDDpHbjTAdhb3xQEvN4ta11/emhFDJGa
         QpMKVFr0tf7ykQGWSfENFbenE226jW15+y9mfFBxv4brDGonrx++3F9ugZXs4bem5P49
         PKjAuiKYU9XPea4VzzK8rpigfV5GuqgZoUtezyisbmfT8j+tMdBjd3Oml/wqsbtJWKvp
         OJ5g==
X-Gm-Message-State: APuU4Z9sF4bjLG4ezgUdqzQC+jwC3LaUu3Qz0/3T1QppWUHqcNONfkLZ
	PO3d0iPxYNoySaQgvfytPMGzpNp4TG4sZEwDW+mkc4eLcTMTRDWQ2BjL9knjO6KFm1+7G7F85Sd
	G472GDWAoAPbxfzm+hgdPhvWW7hUlaVO4/oXVQEe+hu7BsCaJL7gDTxr/r7zJM3Is0+Rcvw==
X-Gm-Gg: AYBFou1dMSq/8Oxeqtiop2Ci/GcovyBz4mYeS4+ml22BPeGG6VuNI7SeAGfAkFSErXm
	JgZbXWS10v0tzvjrL/hShE13NuVJB/ydio3V8KqzIs6Eqk9b9w/QT7LKzqgo3rwaESIZtkIq328
	Ir0Oin3HHzLJPVEjUXdYWpZXKMyCz+v7eRbvt5ljG4T1JTfGAlDcZ6b/8TOWF3y8iUXP4T9CRxz
	VIfMaQ95DCbFgPgzZ3IP+HhFTZTVWXI78PGm0JCi8pQIzX97pdialAYjJ0fKhaZ/zHSCUdyPmun
	rD4HxHIkLpVDqtaXnVfFU3gA1iiyiXX2cyOz3gljweYGCp6mvtnu1kFJx1Bq2m1GHw/JEs6y1ng
	43yPkkILnqgeMbCuyvIJ3oFzhO+8ynsAH2AdqodVXYR2+2yI423bk8CD4tFCt7FsDQ/lJjramNf
	gVLoin2yLz5g==
X-Received: by 2002:a05:693c:8110:b0:372:390e:1499 with SMTP id 5a478bee46e88-3751f078702mr1837345eec.21.1794285184638;
        Mon, 09 Nov 2026 20:33:04 -0800 (PST)
X-Received: by 2002:a05:693c:8110:b0:372:390e:1499 with SMTP id 5a478bee46e88-3751f078702mr1837296eec.21.1794285183554;
        Mon, 09 Nov 2026 20:33:03 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:03 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 02/19] wifi: nl80211/cfg80211: extend NAN function and configuration for discovery offload
Date: Tue, 10 Nov 2026 10:02:25 +0530
Message-Id: <20261110043242.2012238-3-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX4hhK6FikOaIq
 IsIY7+XU80shFt+hb6VuZEnDXtEea3F8UJRQYmJ5Ukeo23N+8GQ5JaRhcnwPdGQuEBYwGNn1ZDI
 YLEudyUpgstGs4YpeihzTo1uEnwBEck=
X-Proofpoint-GUID: MIZLEhFajCwL6kPKfbcAVKLK5GxV3Iav
X-Proofpoint-ORIG-GUID: MIZLEhFajCwL6kPKfbcAVKLK5GxV3Iav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX77/oeQWxwDN4
 U6jhP7kojyz/kFqcEltSeouNHiqmLmT3ctykHpQCVypRYEMVcHsZTzxjTQKcofCmCtj3VDMjZH5
 /tHplWLLQDPxE4BBFWbfXuv9ezzhkkvL33tmX50gznv31o1/cbnuilQWEF0Dtx87LOphgxd8Jca
 7XCi1vR5e1DVCWbkSYFFRH6qTBh2oBGtWfR2+C6L5XHiKJU1HpKm33ScYKjOSVFlcDe4Zvzm9zL
 Xv6J4iJW6W2RsOXzBfSPLCqo+3+XCM9hVnNynfXdMQlCPL4/gm5ytoRlLtUkiYoUBNlHoM+cBZC
 Bb51stwiUZ0MbcnpTD/kVWdoVQGrlx4CFNnmBcoyxHBiOR2vMViR2cJKvVtPBP+OEEzwoorooB6
 wMsuf9EMU5SGRWmlUwaWKhmUTeusXbBVJjyVuFeOYoRTq4MHtUrr3z263oISvSaaa/Yn5QtAC5x
 brqgQNMFEUQqJ0IzujA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af29e82 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Gx1jd3SvvzcaTJcscWsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

Allow userspace to provide the NAN service parameters needed by an
offloaded Discovery Engine. Add flags for the SDEA Data Path Required,
Security Required, and GTK Required bits, and attributes for pairing
bootstrapping methods, supported NAN cipher suite IDs, and the ND-PMK.
Require SECURE_NAN for security-related service parameters, and validate
CSID arrays and ND-PMK lengths in the netlink policy.

Pairing Setup and NPK/NIK Caching are device capabilities advertised in
the Device Capability Extension attribute, so carry them in NAN config.
Accept these flags only when the Discovery Engine is offloaded and
SECURE_NAN is supported.

Store ND-PMK material in dynamically sized memory, free it with
kfree_sensitive(), and clear the ADD_NAN_FUNCTION request skb because
it may contain key material.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  24 +++++++
 include/uapi/linux/nl80211.h |  36 +++++++++++
 net/wireless/nl80211.c       | 118 ++++++++++++++++++++++++++++++++++-
 net/wireless/util.c          |   2 +
 4 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 46ba0fb27b14..11d5650c23c5 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4203,6 +4203,8 @@ struct cfg80211_nan_band_config {
  *	notifications.
  * @instant_comm: if true, start Instant Communication (IC) as defined in
  *	Chapter 13 of the Wi-Fi Aware Specification v4.0.
+ * @pairing_setup: if true, enable NAN pairing setup.
+ * @pairing_npk_caching: if true, enable NPK/NIK caching.
  * @band_cfgs: array of band specific configurations, indexed by
  *	&enum nl80211_band values.
  * @extra_nan_attrs: pointer to additional NAN attributes.
@@ -4219,6 +4221,8 @@ struct cfg80211_nan_conf {
 	u8 discovery_beacon_interval;
 	bool enable_dw_notification;
 	bool instant_comm;
+	bool pairing_setup;
+	bool pairing_npk_caching;
 	struct cfg80211_nan_band_config band_cfgs[NUM_NL80211_BANDS];
 	const u8 *extra_nan_attrs;
 	u16 extra_nan_attrs_len;
@@ -4395,6 +4399,18 @@ struct cfg80211_nan_func_filter {
  * @num_tx_filters: length of &tx_filters.
  * @instance_id: driver allocated id of the function.
  * @cookie: unique NAN function identifier.
+ * @data_path_required: if true, the SDEA Data Path Required bit is set.
+ * @security_required: if true, the SDEA Security Required bit is set. Requires
+ *	@data_path_required and %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @gtk_required: if true, the SDEA GTK Required bit is set for GTK protection
+ *	of group-addressed data frames. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @pairing_bootstrap_methods: bitmap of supported NAN pairing
+ *	bootstrapping methods per the Wi-Fi Aware Specification Table 9-321.
+ * @csids: array of u32 NAN Cipher Suite ID (CSID) selectors supported by
+ *	this service. See the Wi-Fi Aware Specification for cipher suite values.
+ * @num_csids: number of entries in @csids.
+ * @nd_pmk: pointer to the pre-shared NAN Data Path PMK (ND-PMK).
+ * @nd_pmk_len: length of @nd_pmk in bytes; depends on the cipher suite.
  */
 struct cfg80211_nan_func {
 	enum nl80211_nan_function_type type;
@@ -4421,6 +4437,14 @@ struct cfg80211_nan_func {
 	u8 num_rx_filters;
 	u8 instance_id;
 	u64 cookie;
+	bool data_path_required;
+	bool security_required;
+	bool gtk_required;
+	u16 pairing_bootstrap_methods;
+	u32 *csids;
+	u8 num_csids;
+	const u8 *nd_pmk;
+	u8 nd_pmk_len;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b56a96f57bec..4037a0f78ef6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7753,6 +7753,24 @@ enum nl80211_nan_func_term_reason {
  *	Its type is u8 and it cannot be 0.
  * @NL80211_NAN_FUNC_TERM_REASON: NAN function termination reason.
  *	See &enum nl80211_nan_func_term_reason.
+ * @NL80211_NAN_FUNC_DATA_PATH_REQUIRED: flag attribute. Sets the SDEA "Data
+ *	Path Required" bit.
+ * @NL80211_NAN_FUNC_SECURITY_REQUIRED: flag attribute. Sets the SDEA
+ *	"Security Required" bit. Requires
+ *	@NL80211_NAN_FUNC_DATA_PATH_REQUIRED and
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_GTK_REQUIRED: flag attribute. Sets the SDEA "GTK
+ *	Required" bit for GTK protection of group-addressed data frames.
+ *	Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS: u16 bitmap of supported
+ *	NAN pairing bootstrapping methods as defined in Wi-Fi Aware
+ *	specification Table 9-321. Each bit corresponds to one method. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_CSIDS: a set of u32 NAN Cipher Suite ID (CSID)
+ *	selectors supported by this service. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_ND_PMK: pre-shared NAN Data Path PMK (ND-PMK); its length
+ *	depends on the cipher suite. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -7775,6 +7793,12 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_TX_MATCH_FILTER,
 	NL80211_NAN_FUNC_INSTANCE_ID,
 	NL80211_NAN_FUNC_TERM_REASON,
+	NL80211_NAN_FUNC_DATA_PATH_REQUIRED,
+	NL80211_NAN_FUNC_SECURITY_REQUIRED,
+	NL80211_NAN_FUNC_GTK_REQUIRED,
+	NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS,
+	NL80211_NAN_FUNC_CSIDS,
+	NL80211_NAN_FUNC_ND_PMK,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -7916,6 +7940,16 @@ enum nl80211_nan_band_conf_attributes {
  *	Wi-Fi Aware Specification v4.0.
  *	%NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL must be set as well.
  *	This is a flag attribute.
+ * @NL80211_NAN_CONF_PAIRING_SETUP: flag attribute. Enables NAN pairing setup
+ *	and is advertised as "Pairing Setup Enabled" in the DCEA. Only valid for
+ *	devices that offload the NAN Discovery Engine (i.e. without
+ *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_CONF_PAIRING_NPK_CACHING: flag attribute. Enables NPK/NIK
+ *	caching and is advertised as "NPK/NIK Caching Enabled" in the DCEA. Only
+ *	valid for devices that offload the NAN Discovery Engine (i.e. without
+ *	%NL80211_NAN_CAPA_USERSPACE_DE) and requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NUM_NL80211_NAN_CONF_ATTR: Internal.
  * @NL80211_NAN_CONF_ATTR_MAX: Highest NAN configuration attribute.
  *
@@ -7932,6 +7966,8 @@ enum nl80211_nan_conf_attributes {
 	NL80211_NAN_CONF_DISCOVERY_BEACON_INTERVAL,
 	NL80211_NAN_CONF_NOTIFY_DW,
 	NL80211_NAN_CONF_INSTANT_COMM,
+	NL80211_NAN_CONF_PAIRING_SETUP,
+	NL80211_NAN_CONF_PAIRING_NPK_CACHING,
 
 	/* keep last */
 	NUM_NL80211_NAN_CONF_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 858baaff9db9..1331fe716985 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -432,6 +432,34 @@ static int validate_nan_cluster_id(const struct nlattr *attr,
 	return 0;
 }
 
+static int validate_nan_csids(const struct nlattr *attr,
+			      struct netlink_ext_ack *extack)
+{
+	unsigned int len = nla_len(attr);
+
+	if (!len || len % sizeof(u32)) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "CSIDs must be a non-empty array of u32 values");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int validate_nan_pmk(const struct nlattr *attr,
+			    struct netlink_ext_ack *extack)
+{
+	unsigned int len = nla_len(attr);
+
+	if (len != WLAN_PMK_LEN && len != WLAN_PMK_LEN_SUITE_B_192) {
+		NL_SET_ERR_MSG_ATTR(extack, attr,
+				    "ND-PMK length must be 32 or 48 octets");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int validate_nan_avail_blob(const struct nlattr *attr,
 				   struct netlink_ext_ack *extack)
 {
@@ -787,6 +815,8 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 		NLA_POLICY_RANGE(NLA_U8, 50, 200),
 	[NL80211_NAN_CONF_NOTIFY_DW] = { .type = NLA_FLAG },
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_PAIRING_SETUP] = { .type = NLA_FLAG },
+	[NL80211_NAN_CONF_PAIRING_NPK_CACHING] = { .type = NLA_FLAG },
 };
 
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
@@ -1334,6 +1364,16 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 	[NL80211_NAN_FUNC_TX_MATCH_FILTER] = { .type = NLA_NESTED },
 	[NL80211_NAN_FUNC_INSTANCE_ID] = { .type = NLA_U8 },
 	[NL80211_NAN_FUNC_TERM_REASON] = { .type = NLA_U8 },
+	[NL80211_NAN_FUNC_DATA_PATH_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_SECURITY_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_GTK_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] = { .type = NLA_U16 },
+	[NL80211_NAN_FUNC_CSIDS] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_csids,
+				       U8_MAX * sizeof(u32)),
+	[NL80211_NAN_FUNC_ND_PMK] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_pmk,
+				       WLAN_PMK_LEN_SUITE_B_192),
 };
 
 /* policy for Service Response Filter attributes */
@@ -17243,6 +17283,27 @@ static int nl80211_parse_nan_conf(struct wiphy *wiphy,
 		}
 	}
 
+	if (attrs[NL80211_NAN_CONF_PAIRING_SETUP] ||
+	    attrs[NL80211_NAN_CONF_PAIRING_NPK_CACHING]) {
+		if (wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Pairing configuration requires an offloaded NAN Discovery Engine");
+			return -EOPNOTSUPP;
+		}
+
+		if (!wiphy_ext_feature_isset(wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Pairing configuration requires SECURE_NAN");
+			return -EOPNOTSUPP;
+		}
+	}
+
+	conf->pairing_setup =
+		nla_get_flag(attrs[NL80211_NAN_CONF_PAIRING_SETUP]);
+	conf->pairing_npk_caching =
+		nla_get_flag(attrs[NL80211_NAN_CONF_PAIRING_NPK_CACHING]);
+
 out:
 	if (!conf->band_cfgs[NL80211_BAND_5GHZ].chan &&
 	    (!conf->bands || conf->bands & BIT(NL80211_BAND_5GHZ))) {
@@ -17581,6 +17642,60 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 	}
 
+	func->data_path_required =
+		nla_get_flag(tb[NL80211_NAN_FUNC_DATA_PATH_REQUIRED]);
+	func->security_required =
+		nla_get_flag(tb[NL80211_NAN_FUNC_SECURITY_REQUIRED]);
+	func->gtk_required = nla_get_flag(tb[NL80211_NAN_FUNC_GTK_REQUIRED]);
+
+	if (func->security_required && !func->data_path_required) {
+		NL_SET_ERR_MSG(info->extack,
+			       "SDEA Security Required requires Data Path Required");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (func->security_required || func->gtk_required ||
+	    tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] ||
+	    tb[NL80211_NAN_FUNC_CSIDS] || tb[NL80211_NAN_FUNC_ND_PMK]) {
+		if (!wiphy_ext_feature_isset(wdev->wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN)) {
+			NL_SET_ERR_MSG(info->extack,
+				       "Security attributes require SECURE_NAN");
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+
+		if (tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS])
+			func->pairing_bootstrap_methods =
+				nla_get_u16(tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS]);
+
+		if (tb[NL80211_NAN_FUNC_CSIDS]) {
+			int len = nla_len(tb[NL80211_NAN_FUNC_CSIDS]);
+			int n = len / sizeof(u32);
+
+			func->csids = kmemdup(nla_data(tb[NL80211_NAN_FUNC_CSIDS]),
+					      len, GFP_KERNEL);
+			if (!func->csids) {
+				err = -ENOMEM;
+				goto out;
+			}
+			func->num_csids = n;
+		}
+
+		if (tb[NL80211_NAN_FUNC_ND_PMK]) {
+			int len = nla_len(tb[NL80211_NAN_FUNC_ND_PMK]);
+
+			func->nd_pmk = kmemdup(nla_data(tb[NL80211_NAN_FUNC_ND_PMK]),
+					       len, GFP_KERNEL);
+			if (!func->nd_pmk) {
+				err = -ENOMEM;
+				goto out;
+			}
+			func->nd_pmk_len = len;
+		}
+	}
+
 	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!msg) {
 		err = -ENOMEM;
@@ -21051,7 +21166,8 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit = nl80211_nan_add_func,
 		.flags = GENL_ADMIN_PERM,
-		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
+					 NL80211_FLAG_CLEAR_SKB),
 	},
 	{
 		.cmd = NL80211_CMD_DEL_NAN_FUNCTION,
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 24cf0a2ba721..980b16c72d4f 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2878,6 +2878,8 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f)
 	kfree(f->serv_spec_info);
 	kfree(f->srf_bf);
 	kfree(f->srf_macs);
+	kfree(f->csids);
+	kfree_sensitive(f->nd_pmk);
 	for (i = 0; i < f->num_rx_filters; i++)
 		kfree(f->rx_filters[i].filter);
 
-- 
2.34.1

