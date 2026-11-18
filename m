Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983821;
	b=Spx0KStjaMbReWO+a0TRxzj7dbklHP1bExdr/qb2h54T5/9CRpX/IdLEGNJr/+iysPor
	 3q5N6Ax0wBwNXdoP7gaeixwb9XNGHOXWUqxrQbvKyeGpS0H1fiZN6c+6bccmvAI9PSkGW
	 m6VYCxO6DafK3MeouL9HLlmW2lYHty31ROYzMwViWDI/zTmbu/4zxBiL8wYMoexysWitE
	 8Ln3sg2o6Zf34YCBMjTk8S+HoAr3p7aBaMbptX9iXbrkwevnri9ju+Ssaa0QJB8XyD/dL
	 9TRDeawz8/EOtP41XzxrMDSzgTSR3jROR5h3Z/pPRqTwqj3IyaZQmYTFfMcqsFdthRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G/7+TxN22H+dERfNtvUqvw9pT9BxohESmZSeP1ZMq3A=;
	b=vav93J7V8W9R1fCgjhCC8bAbRUJJAsXKv3qhFgS+uMs9RndzxEtMcX6M95gihafNRHS2
	 e0MkVUPt0Sjv324OzTWWUvB15U4ZdCmwpFSPJOZj4uAEO4jFsFAH2L3KVuxCL8oeQZlar
	 Bj92IaUBpcI0jXpV591EpXFFFJktP6BAI3wn5d0KYRc4io7Xsddv8mqSw1XtVQlTJgu2S
	 r2IhPSoF6KZJxeWdV2B168bnNZNRmBHJqxjAq8MGhALldNuD7IZS9cHwViqH9emWYIrJw
	 OhiYKYYSXynx/J2dLzjaoYC6C7uaBbBBnwSvZQu47UwmianM24QJI4kjM61YKEwwwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O/rDxMlL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF4WABsH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A29D606A334
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A29D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O/rDxMlL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF4WABsH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V22Y1959905
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/7+TxN22H+
	dERfNtvUqvw9pT9BxohESmZSeP1ZMq3A=; b=O/rDxMlLAhIdFwJFlI/OUhuX1eK
	EagDq002VSIOXAH/NwKQdm1rWKj8Nwv2mHEIlAIiJfDsOUYnv8RBzd2mrSkcpBqU
	kVqMG85ntiRCmCZS4TOq1MJ3jjWG1itFHdUAYDoapTh+1PoE/Y7wThiVRiddqVfe
	QjKkuGy/4xel6slH+5pPwTZ7qVKj13bx26GCPAz4D5qKHtRz7KrmO8ONSIV3xekL
	aO3M3pN+ew/UWGVTJUagp7OyRH6Brm3JcmBWmm4JIFmEc4ev2GKCBM8RnGVarZtb
	0nHa+qegBKVdUC0l652ltmdrzugfrRU7U2PMFi9ir7OWwur++c28AoLvm8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hk93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:37:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so872737eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983820; x=1795588620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/7+TxN22H+dERfNtvUqvw9pT9BxohESmZSeP1ZMq3A=;
        b=AF4WABsHdvcwpRJpGjmFgKMlmHi13SDQ51B5lmBR+I/g1WHM/A4zFjMRSvm8LcB0tj
         1NHFaJZK3o64y53tPmh395QprAg9sR/Sp5bHCRld+sPeebCZpP6bEaL43raWyqmI9adV
         qppVCQQcUAJwUCRCAgC33GqSZvzit+zJe6Ni/bcgPDEc94cCzdVJ/V16M3E07+tzXohI
         /JunhEy1fuc3SMhryDwTBufy+Q+Kgv+KdG96Ty3UyFi7Rs0/PpbOYpbG4RfgHLEx1KDF
         fcf9wlKLY2ejPt9Y9GAnOvLmbSsvfzOF4oOIJTdLRZJP8Ny2at9CEbcZLgahKPDK8AVM
         P3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983820; x=1795588620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/7+TxN22H+dERfNtvUqvw9pT9BxohESmZSeP1ZMq3A=;
        b=s4njARATMbMT9a+us6CwrvdgAzWPjxM/Vze5bSSXtZv1uqRDiywjykhyPqyEqlK64B
         keSfwqwSDhttsKVal4P+/BazzHD73MQxeQPVpLE8n1IDBEBctUgWj6Mg8E5Y0KRi/Je6
         HmPK0K9PJ+OW1y/p1KEGoL2sHwXwLC6h1DNHI4Dlx+eEPT0VUXU6MyssqW/UilnKcruu
         GDJs44q2c22k+Td8LsCCh68XJ4T5GM/jDj6hs6tjIelGqmUJe6wf2IreWHgBazRFNYon
         hTy+ZSMNtgNwndSsr3qPRdAFGOLk+Sfn4y2APwS/34QpbbVIihYM9Qw9spIMkrjVvbzX
         jCuw==
X-Gm-Message-State: APuU4Z/aeIu3K9/AK2hW16y8Qd2CZuCa0YYtrFxSiNWZ/wQzzaHnFWFI
	tI2W5CuespH1MXlPmTE94Gd+zhODQW+pdxBREpleq01O/FkUWjyH2TiBXkNAwKHynq5kswfrb5O
	mM+crjnDYYTo1XB5Em2+Fi/gRPRzxp1avyUX6tTHossQvuXusOdqpFLFlTrpGbrK2fDJgqKy076
	n4Bw==
X-Gm-Gg: AZFdTZeiRQdsxCjsyGRYMqVw+dHY/i+Fpdppgolm/U2mOo7tyAULaOkNC2W4PcyDB5r
	EXZTiiWKBiuf9TFSuoFudhDXhswkHiy2XRa4Im0BQNtV9nq8yfYXTe1Lucwh8GoLsj8Nk/Uv9FU
	yDtbIR4pGJPLrUgp8XsMS1dt3XuRcVPdUK/NJjXbrU5P61YHxEN5afy/axxDXQSsT9J8Q1QXaIr
	APmiv63OdZdguSy0aawevnBSacvflLAju3323DJTNWI+vXJkCe6GSIySeFGXyKmfsUCPrQDRY2l
	+T1ehPgokar9zVCmGzYYccqdRkt5gSj+b4LIeSIJ+HJK+4FaZQDX0NQullRpVLt+f6XaiELqiRJ
	IPQHIRecUMM8eNhZmYSD6mmuH/Rh/Ii0+iiXybWeMAzv7PqMXHm15WepHKg9aGqrIdlZffnGp3G
	sw2SetqWF3Rw==
X-Received: by 2002:a05:7301:716:b0:381:725a:458f with SMTP id 5a478bee46e88-3827db0e37fmr1730359eec.1.1794983819444;
        Tue, 17 Nov 2026 22:36:59 -0800 (PST)
X-Received: by 2002:a05:7301:716:b0:381:725a:458f with SMTP id 5a478bee46e88-3827db0e37fmr1730336eec.1.1794983818889;
        Tue, 17 Nov 2026 22:36:58 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:58 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 18/19] wifi: nl80211/cfg80211: add NAN group key capabilities to NAN functions
Date: Wed, 18 Nov 2026 12:05:53 +0530
Message-Id: <20261118063554.2260397-19-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd478c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WFFLawxlNp6tfJMvWTEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RaxFv4qx8f451CDZTzmh39e3orCkC95t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX3SdDPETf91p9
 gGlnum8pplwv0P9V98qjrmPR6y+KtRSsAJtOJwvRcT39U2+ob/qqz7UISDkJGNE942lU3MLmjl5
 PuKx+QcFF91nozkajDzDRcaD/resLNBgSM27qHfqrI8C9m/LutuL45MPSXO58EY0phEsOJ+bP85
 QhpWNcfKkj68FW5lR99fyFzpl79ARvinvwPMSc0JJj4M1Gcgqc4s5wmPVu9AOl866TUEtLnBAfL
 kmYoXC71EEVbXVlUV+Wp/s7E8q1dW64COx1YDM3BZy5egaTmETQuaS0qd1iHOZtkLVG3LKYlmRC
 f30ToUqPOAN+RtP3POhGkE14ZgNpXVYyJivHxZ1ukb9cNS8UuiZfX/FDHhAZ57KZs9BYDsxRwWO
 Af1KByi7dzR1dOCTLPLO5ABridVGKnDHnDGPMZvpa89K5a2IsfReF1Jl8xp1O46e2fUEf8UCY4A
 xiVLMZj1xvzc35zxQHA==
X-Proofpoint-GUID: RaxFv4qx8f451CDZTzmh39e3orCkC95t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX/g3TELnDdEXC
 9vrMeVpJCPHP1KwC3/GME8HtZNgWPW6P8EBM2GeM62VPjeujZD2+vDW9fdj9aVaCUtHHm040c6X
 dusma2jBaFvRa3/ICfKZ6i2jqGXySgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

From: Vinay Gannevaram <vganneva@qti.qualcomm.com>

A NAN service advertises in its Cipher Suite Info attribute whether it
supports group keys (GTK and IGTK, optionally BIGTK) and whether IGTK
and BIGTK use NCS-BIP-GMAC-256 instead of NCS-BIP-CMAC-128. With an
offloaded Discovery Engine and NDP setup, the device builds this
attribute for the Service Discovery Frames of the function and for the
NDP setup frames, and it distributes and installs the group keys during
NDP setup. So far, NDP offload only covers the GTK, which is requested
per NDP.

Add NL80211_NAN_FUNC_GROUP_KEYS and NL80211_NAN_FUNC_BIP_GMAC_256 to
configure the group-key support of a function. The device also uses it
for NDPs of the service and establishes the group keys that both peers
support; the per-NDP GTK requirement and GTK cipher are unchanged. Use
typed attributes rather than the raw capability field, whose other bits,
such as the number of replay counters, are properties of the device.

Signed-off-by: Vinay Gannevaram <vganneva@qti.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 37 +++++++++++++++++++++++++++---------
 include/uapi/linux/nl80211.h | 34 ++++++++++++++++++++++++++++++---
 net/wireless/nl80211.c       | 18 ++++++++++++++++++
 3 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 0964301473e1..9aae48c2b95d 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4404,7 +4404,8 @@ struct cfg80211_nan_peer_sched {
  * @pmk_len: length of @pmk in bytes
  * @pmkid: PMKID (16 octets) to include in the NDP Request, or NULL if absent
  * @gtk_required: if true, GTK protection is required for group-addressed data
- *	frames
+ *	frames. IGTK and BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
  * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
  * @ndp_id: output NDP ID assigned by the driver on success (1-255)
@@ -4459,7 +4460,8 @@ struct cfg80211_nan_ndp_initiate {
  *	@cipher_suite and %NL80211_EXT_FEATURE_SECURE_NAN.
  * @pmk_len: length of @pmk in bytes
  * @gtk_required: if true, GTK protection is required for group-addressed data
- *	frames
+ *	frames. IGTK and BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
  * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
  * @transport_info: if true, convey @transport_port and @transport_protocol to
@@ -4523,7 +4525,9 @@ struct cfg80211_nan_ndp_terminate {
  * @ssi_len: length of @ssi
  * @cipher_suite: initiator's cipher suite ID
  * @pmkid: PMKID from the peer's SCIA attribute (16 bytes), or NULL if absent
- * @gtk_required: if true, initiator requires GTK protection
+ * @gtk_required: if true, the initiator requires GTK protection. IGTK and
+ *	BIGTK follow the service group-key support, see
+ *	&struct cfg80211_nan_func.group_keys.
  * @gtk_cipher: GTK cipher suite ID, included when @gtk_required is true
  * @ipv6_intf_id: initiator's IPv6 link-local interface identifier, or NULL
  *	if absent
@@ -4668,7 +4672,20 @@ struct cfg80211_nan_func_filter {
  * @security_required: if true, the SDEA Security Required bit is set. Requires
  *	@data_path_required and %NL80211_EXT_FEATURE_SECURE_NAN.
  * @gtk_required: if true, the SDEA GTK Required bit is set for GTK protection
- *	of group-addressed data frames. Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ *	of group-addressed data frames. This is independent of @group_keys, which
+ *	advertises service group-key support. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @group_keys: group-key support of the service, advertised in the Cipher
+ *	Suite Info attribute of the Service Discovery Frames of this function, as
+ *	defined by &enum nl80211_nan_group_keys. With
+ *	%WIPHY_NAN_FLAGS_OFFLOAD_NDP the device also uses it for NDPs of the
+ *	service: it advertises it in NDP setup frames (an NDP initiator uses its
+ *	subscribe function) and establishes the group keys that both peers
+ *	support. If zero, no group-key support is advertised. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @bip_gmac_256: if true, IGTK and BIGTK use NCS-BIP-GMAC-256 instead of
+ *	NCS-BIP-CMAC-128. Requires @group_keys and
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @pairing_bootstrap_methods: bitmap of supported NAN pairing
  *	bootstrapping methods per the Wi-Fi Aware Specification Table 9-321.
  * @csids: array of u32 NAN Cipher Suite ID (CSID) selectors supported by
@@ -4727,6 +4744,8 @@ struct cfg80211_nan_func {
 	bool data_path_required;
 	bool security_required;
 	bool gtk_required;
+	u8 group_keys;
+	bool bip_gmac_256;
 	u16 pairing_bootstrap_methods;
 	u32 *csids;
 	u8 num_csids;
@@ -6781,15 +6800,15 @@ struct wiphy_radio {
  *	%NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS. The device learns and manages peer
  *	NAN schedules; userspace must not set them with
  *	%NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for locally
- *	initiated NDPs, derives, installs, and removes PTKs and, when requested,
- *	GTKs. The device creates and removes NDI peer stations for offloaded NDPs.
- *	Userspace must not add those NDI peer stations or their
+ *	initiated NDPs, derives, installs, and removes PTKs and, when negotiated,
+ *	GTKs, IGTKs, and BIGTKs (see &struct cfg80211_nan_func.group_keys). The
+ *	device creates and removes NDI peer stations for offloaded NDPs. Userspace
+ *	must not add those NDI peer stations or their
  *	keys. NDP offload is supported on all bands in
  *	&struct wiphy.nan_supported_bands. The device supplies the band-specific
  *	capabilities, such as the HE 6 GHz band and EHT capabilities, and the
  *	regulatory information in the frames it builds. The driver implements
- *	@nan_ndp_initiate,
- *	@nan_ndp_respond, and
+ *	@nan_ndp_initiate, @nan_ndp_respond, and
  *	@nan_ndp_terminate callbacks. It supports
  *	%NL80211_CMD_NAN_NDP_INITIATE, %NL80211_CMD_NAN_NDP_RESPOND, and
  *	%NL80211_CMD_NAN_NDP_TERMINATE, and
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 2581b7328867..8976154fdfcd 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7888,6 +7888,17 @@ enum nl80211_nan_publish_type {
 	NL80211_NAN_UNSOLICITED_PUBLISH = 1 << 1,
 };
 
+/**
+ * enum nl80211_nan_group_keys - NAN group key support
+ * @NL80211_NAN_GROUP_KEYS_GTK_IGTK: the service supports GTK and IGTK.
+ * @NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK: the service supports GTK, IGTK,
+ *	and BIGTK.
+ */
+enum nl80211_nan_group_keys {
+	NL80211_NAN_GROUP_KEYS_GTK_IGTK = 1,
+	NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK = 2,
+};
+
 /**
  * enum nl80211_nan_func_term_reason - NAN functions termination reason
  *
@@ -7953,7 +7964,9 @@ enum nl80211_nan_func_term_reason {
  *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NL80211_NAN_FUNC_GTK_REQUIRED: flag attribute. Sets the SDEA "GTK
  *	Required" bit for GTK protection of group-addressed data frames.
- *	Requires %NL80211_EXT_FEATURE_SECURE_NAN.
+ *	This is separate from @NL80211_NAN_FUNC_GROUP_KEYS, which advertises the
+ *	service's group-key support in its Cipher Suite Info attribute. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  * @NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS: u16 bitmap of supported
  *	NAN pairing bootstrapping methods as defined in Wi-Fi Aware
  *	specification Table 9-321. Each bit corresponds to one method. Requires
@@ -7989,6 +8002,17 @@ enum nl80211_nan_func_term_reason {
  *	uses include the NAN Identity Resolution attribute for pairing
  *	verification in Publish and Subscribe messages. Requires
  *	%NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS.
+ * @NL80211_NAN_FUNC_GROUP_KEYS: u8 attribute, see &enum nl80211_nan_group_keys.
+ *	Group-key support of the service, advertised in the Cipher Suite Info
+ *	attribute of the Service Discovery Frames of this function. With
+ *	%NL80211_NAN_CAPA_OFFLOAD_NDP the device also uses it for NDPs of the
+ *	service: it advertises it in the NDP setup frames (an NDP initiator uses
+ *	its subscribe function) and establishes the group keys that both peers
+ *	support. If absent, no group-key support is advertised. Requires
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_FUNC_BIP_GMAC_256: flag attribute. IGTK and BIGTK use
+ *	NCS-BIP-GMAC-256 instead of NCS-BIP-CMAC-128. Requires
+ *	@NL80211_NAN_FUNC_GROUP_KEYS and %NL80211_EXT_FEATURE_SECURE_NAN.
  *
  * @NUM_NL80211_NAN_FUNC_ATTR: internal
  * @NL80211_NAN_FUNC_ATTR_MAX: highest NAN function attribute
@@ -8026,6 +8050,8 @@ enum nl80211_nan_func_attributes {
 	NL80211_NAN_FUNC_CHAN,
 	NL80211_NAN_FUNC_RANGE_REPORT,
 	NL80211_NAN_FUNC_EXTRA_ATTRS,
+	NL80211_NAN_FUNC_GROUP_KEYS,
+	NL80211_NAN_FUNC_BIP_GMAC_256,
 
 	/* keep last */
 	NUM_NL80211_NAN_FUNC_ATTR,
@@ -8244,7 +8270,8 @@ enum nl80211_nan_conf_attributes {
  *	it carries the PMKID received in the peer's SCIA for cached-PMK lookup.
  * @NL80211_NAN_NDP_ATTR_GTK_REQUIRED: flag indicating that GTK protection is
  *	required for group-addressed data frames. Requires
- *	@NL80211_NAN_NDP_ATTR_GTK_CIPHER; IGTK and BIGTK are not covered.
+ *	@NL80211_NAN_NDP_ATTR_GTK_CIPHER. IGTK and BIGTK are set up according to
+ *	the group-key support of the service, see %NL80211_NAN_FUNC_GROUP_KEYS.
  * @NL80211_NAN_NDP_ATTR_GTK_CIPHER: u32 GTK cipher suite ID. Required if
  *	@NL80211_NAN_NDP_ATTR_GTK_REQUIRED is set.
  * @NL80211_NAN_NDP_ATTR_IPV6_INTF_ID: binary IPv6 link-local interface
@@ -9562,7 +9589,8 @@ enum nl80211_s1g_short_beacon_attrs {
  *	device learns and manages peer NAN schedules; userspace must not set them
  *	with %NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for
  *	locally initiated NDPs and derives, installs, and removes data path keys
- *	(PTK and, when requested, GTK). The device creates and removes NDI peer
+ *	(PTK and, when negotiated, GTK, IGTK, and BIGTK, see
+ *	%NL80211_NAN_FUNC_GROUP_KEYS). The device creates and removes NDI peer
  *	stations for offloaded NDPs. Userspace must not add those NDI peer stations
  *	or their keys. NDP offload is supported on every band that the device
  *	reports for NAN in %NL80211_ATTR_BANDS. The device supplies the band-specific
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fe20d4eb6f4b..34d2072eb4cd 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1477,6 +1477,10 @@ nl80211_nan_func_policy[NL80211_NAN_FUNC_ATTR_MAX + 1] = {
 		NLA_POLICY_VALIDATE_FN(NLA_BINARY,
 				       validate_nan_func_extra_attrs,
 				       IEEE80211_MAX_DATA_LEN),
+	[NL80211_NAN_FUNC_GROUP_KEYS] =
+		NLA_POLICY_RANGE(NLA_U8, NL80211_NAN_GROUP_KEYS_GTK_IGTK,
+				 NL80211_NAN_GROUP_KEYS_GTK_IGTK_BIGTK),
+	[NL80211_NAN_FUNC_BIP_GMAC_256] = { .type = NLA_FLAG },
 };
 
 /* policy for Service Response Filter attributes */
@@ -17787,6 +17791,11 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	func->security_required =
 		nla_get_flag(tb[NL80211_NAN_FUNC_SECURITY_REQUIRED]);
 	func->gtk_required = nla_get_flag(tb[NL80211_NAN_FUNC_GTK_REQUIRED]);
+	if (tb[NL80211_NAN_FUNC_GROUP_KEYS])
+		func->group_keys =
+			nla_get_u8(tb[NL80211_NAN_FUNC_GROUP_KEYS]);
+	func->bip_gmac_256 =
+		nla_get_flag(tb[NL80211_NAN_FUNC_BIP_GMAC_256]);
 
 	if (func->security_required && !func->data_path_required) {
 		NL_SET_ERR_MSG(info->extack,
@@ -17796,6 +17805,8 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	}
 
 	if (func->security_required || func->gtk_required ||
+	    tb[NL80211_NAN_FUNC_GROUP_KEYS] ||
+	    tb[NL80211_NAN_FUNC_BIP_GMAC_256] ||
 	    tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS] ||
 	    tb[NL80211_NAN_FUNC_CSIDS] || tb[NL80211_NAN_FUNC_ND_PMK]) {
 		if (!wiphy_ext_feature_isset(wdev->wiphy,
@@ -17806,6 +17817,13 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 			goto out;
 		}
 
+		if (func->bip_gmac_256 && !func->group_keys) {
+			NL_SET_ERR_MSG(info->extack,
+				       "BIP-GMAC-256 requires group key support");
+			err = -EINVAL;
+			goto out;
+		}
+
 		if (tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS])
 			func->pairing_bootstrap_methods =
 				nla_get_u16(tb[NL80211_NAN_FUNC_PAIRING_BOOTSTRAP_METHODS]);
-- 
2.34.1

