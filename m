Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565419;
	b=X3x7AZecMxy3WjMpvFFcZAReJuP6OWJBba7NM7vhBqyEJZeA2IjGOgwMbfxh501CsNUf
	 nmpWEVh5Fh38v7riGbwBSu9RKxATOwOMAOYzsoicPxkLev8pqhSDLCymX4fLotbU7Whkv
	 +/ljAeMwKA0kQDVPUY8U+dOF+gljbN/QhvoF/96p5WNK/57YhDoe0AtDIgOw08HMLBoxJ
	 xwa3Rjj8RMD4gkwSONSJCBGVWsCfCrK5sPsqQewDBDrDyyy1EiSYah6Qddw130RcpA9zu
	 JtUQCKHthjXazWGyBoq0nsZ56khZfaHVlvJ34y/bVEOIrPZ+TNTDZ84chRJYVcgzNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8Q6IERXEMqLY1ksaaepveODT4ZE0l6BIyaqZm2YWYok=;
	b=YDPj4Avfplkt4zTpyXQ0gP+r5UbngKYndZJzhkLUfePaGybfVTgSg56s+jWddpkpYB36
	 8NpcXng5mjH282VIPTGuR0spZChMrJv6xgBmcv+IZyn5bqe4g9I9PVTb4Siwn2fG0kzFZ
	 U5r+tDvapsDBtWDNONNxPFbCQC4a+GwZXLRNimPOsyGoT84zChUVpmY0gZwnpjUh1t3U+
	 ivG8DJllaT8t8NudEJUCPgbVYwkEAflzLXykQBQy1MGJ7inTY/bfTHSTl9JIgRBtX6p/5
	 zEYc8LO6eDYLMZfSYFyEAepT4NZ70kyyzZJUELXOoQ1XqTfOT5b1GNqsvxzhE7CZScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI1R5lb4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IxmOQK/M";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078E9606A8A9
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078E9606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI1R5lb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxmOQK/M
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V48M3827105
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Q6IERXEMqL
	Y1ksaaepveODT4ZE0l6BIyaqZm2YWYok=; b=GI1R5lb4QQPJa3URxR35kj+q725
	y5CW7FNBcx6mVIPgszs1vsQZCEsg2fIlqkFG8U5jbfFWWWDbg3gjy+wC+fPBg0b/
	Sa4v6k4GUDLSheJxIiMtgeTu3ZVTJ6dcLvDa+jNNPFm1iRRJ7n8H1J5I8OgXkhr2
	RMONyCVPJUfZQoHnk397cENXK4idKrslsQQhZnvpIH5dgBBJCTl9SyPCWPeyHABu
	MDu4t0b5lQSab82pY9jeOrb0wLSkiVe9CZIABhDw0x/k2kWstpglWy9kl6/Truf8
	/eYoJZYolYRE6aD1vqmW5T2e9DVhlmTrAkeeTj3ijtxw0aiparwvLQiBhiw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37h347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1255632eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565417; x=1795170217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q6IERXEMqLY1ksaaepveODT4ZE0l6BIyaqZm2YWYok=;
        b=IxmOQK/MXcSribNNeYIxqf6IQTlsabH9h4hUXR0UrFQzHD6Z3leXzfl9TrlvCZOQGs
         /xKtfJOps9isDZGOXfabKuaGFamtEodKr+fkR0um/B/vU02WY7ewDq8/s4RvqIqQPnXF
         tSjhHSZ+nd7bbA+KolSugC8FX8Ph1yxTNrEWCJ0Aeo0JXa8XrMBl6BAa6F6NSqMJW+bD
         bceiHMFeADN1TRKHZLQVnkaTEiOQU+Oq2zKoe5rHk9GW6SEv376JWAlih+m3A1duHjoG
         JaHE3MiZ2mwVCaZFUNJos+xJGC5InT3wX8t58fEQmmhYWpZ1aVB9QpSrYd0oZSTk8ai9
         +fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565417; x=1795170217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q6IERXEMqLY1ksaaepveODT4ZE0l6BIyaqZm2YWYok=;
        b=MM4pH/CN40dxVscomFJUJ3S+EKxUy4Ws4HAzNdhb6mNzJwQrxpiBHbKxkl/TEY2c/z
         GfoiiJm0l9kpCTXwPtnzkxXHz16ONvKHC1LZLM41fI98u2NlOdx2CIIn95dSxOSk6MHF
         i+X+eD0LX50BU+ntp02q5XhGovdZ+yxv0YkJBNrYugFhd+pbrsS1bAjINyHIyvS87Prx
         KNz1jZvS9KLTJB8bgZUT4VlKfr3wMuIwi7xDKeuXb7EadSYUkww5gzFLWf5/J+JhPjam
         0ANcEcmsGNkS6W0Rbg3prMIKqqyE9TOLCN1jZOkH3fdS1y7m5LdE0OKLEBctH8qk0BZ9
         hF+A==
X-Gm-Message-State: APuU4Z+zGtR4z3bOux/2b0LtakYh69kf1/iKlKIktOFa+3P1xaUqKiiF
	15r2GcjCxR3JdKSOoUMBS+fFSCJ8tJfAX82vdHnOWSD+Exqba7wdzXukDpoLrr4Fgc0sgBx0kAI
	JPbo5D5NDxVHYZuPj1/Ma38enLNudINeKHFwloDTNUFyYh6LMJGqqlU5ySyN5W2UewNe/Sk/RER
	zYxg==
X-Gm-Gg: AYBFou3Lh9rXhAMiOIywmyVU0lfLnf3QXBfzZCMTZ1PcNxk+LeXN4r475ca1AIA+h7c
	rPBXv9oZWrH1eKHMQzXiCibEeNIYYNfNnDwBLA6Oh9y0R+m/LGe4ll+kXuDVwA9QlI8LfSvmpje
	Qk2pS4qv+BiwTLqfNxXcMYGRCFWH4QP+smIq/gpkmCUcR+zn6iFW5Pjwcjqe9XlpbIu+DKXk5W2
	Qi+GUaCKEtiqo2h7gnIFavZZop1tvp7SlxIvb5y2tfwMvLKdxC3of+3MDCofnExRf2RKABL5Ivw
	GpHk+PvpJD+pTssXz0FB0OCtXsDSRzTZgC6Meh2rgyqg+MwOyA9JwIZDrSirS2NHD4hLDPqufWK
	1HmG7Gj88pvc0SNOvkWqqnt1IkIalSBCMsJAwVHmIn+gy1hw5eNnjo6UhzYvNvtf//qneNTYyxT
	GFwTOx3MMt31s=
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr1549471eec.6.1794565416448;
        Fri, 13 Nov 2026 02:23:36 -0800 (PST)
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr1549442eec.6.1794565415517;
        Fri, 13 Nov 2026 02:23:35 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:35 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 18/19] wifi: nl80211/cfg80211: add NAN group key capabilities to NAN functions
Date: Fri, 13 Nov 2026 15:52:27 +0530
Message-Id: <20261113102228.1917973-19-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX9xHbguHuQU3Q
 XNNrSLgSgq5B/+wtpbYPAF5YkF0ixCiRHKIfu6YnOtFC/A5D+BJP5qNZkUEZrWXoAl6mQwijL51
 INRoHvk67izi3YX0es0w/Gix3eDzEXU=
X-Proofpoint-ORIG-GUID: INjKfGw_xO9a1_QpySPumJN_twwka4zx
X-Proofpoint-GUID: INjKfGw_xO9a1_QpySPumJN_twwka4zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX3FqFCIncReWs
 eZrAVGrHFMJ9lGw+xHUKG3Y9GcTLSik2NYsNlCHNVQmolxqhXvNo6TaKnAts2ydOlVtL6G79r6n
 AoNbNalSMz0FyqAhTaC4ChE47MKutveV7FKMYJyyyM+4DV8zZSsZe9xO5LuOuyYXaOiE1hVuzFG
 FDRgN5WpGVO8jI6iMujM2X+Ab9UnIgKxdq/YIIjvk5ubLUXpynjV3yrXTxpsAdXvdYjF6uRTR9m
 heu4ERhHJTRlN4G/qfo3LoLuKRect011Xzvqy5+/NiLX3fSZCC59ZdVkmETd4mcDVR+fmBzG8vR
 GUFMuGrwhSmYSMcjS9tCSq1Vx5HSm5GWdrASk2vIdiEMRkWWaNXfmEdXK580O+6UjmCahv0xVTR
 YDjCRAirAE1gQk3sBgxvzoTVdP95QSdSnm4P36mz2t8I3XvzJ2iD3tq6l4c/tMcuhRN4diuQYo6
 RQpdElTUEe4ceQZuGIg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6e529 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WFFLawxlNp6tfJMvWTEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

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
index 1856b9cd3f1c..9b105379f3ef 100644
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

