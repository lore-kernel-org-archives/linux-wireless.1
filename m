Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285206;
	b=GjtJhrf56prfRjgW4eKkds+5Y5raGMX9a8KCy2DAeIOIwQaIWoMNaFc1S7/G9exkAPMC
	 rvl2IIeN5HYLUaDAKwyqiJaYkdggI3o8tdQG3WzHrWvBoAhDR7StMkprzmt5VSUhtPR3c
	 Cc3TJjC7cDr2Q7dOka1vjC/ev0WfetDRfTtrwjNrMuspoB447L2jtVB3F4l6i+D3I8NTb
	 7itwHcMVkXICiCQZo6NAIx+zlV3EhgpktpH7f4VExiBFfXfHMgfQP8xomPfxZZKfYkEKN
	 WS0Hj2B9IbcZi0pGuhmSpQ18dnZQZ9VogIvSf7nsZoFucexUVx1mcVe6/7qsBf2uR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=snGxMQtASMtIOegUzcyi4tjGXvbm3lkbCT8kdgJiVHw=;
	b=eUb5A34M4x8edHOCCOUi8BvKDFYFBiJFRZNC00oBAUiZITQ0imdgSqyJsetDtQagg/6M
	 xC00cyvWc3qHOiWJ46nK1UiXxhXKxSG+xG+jFDQ6EgkN+w/06l9gQvSmur8ov6mDKv57q
	 M/xDXiniEuPw3dFgIbNTcn95QhKsB4moHK+cbcOJ2n1pi6IEADNiCzAnnxDAA9fvwN8hF
	 4u+LrJ2jAoqW+fRf40NVcVhNLypqhUACtvRhYgsgxJbaI3IKH71/cVb8tvYwgzBIk1lk+
	 Voo/YWZX+7U+CzyGgpZHvfDFd5BVDuIvU4dQNtSSCH+sfeMROMYoF3eTvzWol0QgEGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Xj5/Ibaj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QkjRV/Ok";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A460A2633
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1A460A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xj5/Ibaj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QkjRV/Ok
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49wQk2297600
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=snGxMQtASMt
	IOegUzcyi4tjGXvbm3lkbCT8kdgJiVHw=; b=Xj5/IbajaXQFlyKEJrJi6dBCdTc
	2q/3A/FA6AMmefNbz8CKhiiUXpp8dgrVyLTKqIyruVNnCHHvBbp98n77RwDxW6Ze
	ZDgKdI/81Efhr7CT99nj8qAitU+4nrHTqY5w+svG3a/3AIEwqja0i2fHSFRec+lC
	qBh8uf048QjDo3naQ2LPQmp6PRXn3KUOMiq/Kk311ZfU9xsAgMdUfYI6hrz9o7lZ
	42rnWWmQryTIC41VbucRRdZaLNbibaOgQfE0JliqaM8aG9dMGEy0jsLLaa4UVRx3
	L9gkYe1wfyQE9+AQ/xNdEi8yjK77iYcpGe3RoKqdatZzhdB7aPtgDDJvjfA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mxmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2290793eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285204; x=1794890004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snGxMQtASMtIOegUzcyi4tjGXvbm3lkbCT8kdgJiVHw=;
        b=QkjRV/OkduOM+XNGiHxETNmxiZqt/krolKvEkeVcj5ULxT712CDAHfAs35eaGcARjh
         QTkr2VTfoR1BReQDdLZS932OIZNzLyulnCPTrW0Wn3cjZDiktuCVwKmG4/kAFjBmreq3
         KI5n7WgQIUanbyz9ebr0flTYTJbBg9HNlKvWIXu18hBeQ63HmKQ5KofOB4EKCMVBqpfx
         B17Lym9Q4W/6zjKdPSvX56poOxlQXzTsQug2ODU1c0M2F2FDamETteb/Ni79jXHZcF+C
         Kexl0u17Z/dfQ+4Vl3dG1CorXBvuwtznNUd6tTM3W5kX0EEl5pF41DkphST+mLfv0Nd6
         ubJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285204; x=1794890004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=snGxMQtASMtIOegUzcyi4tjGXvbm3lkbCT8kdgJiVHw=;
        b=n3XCQBiJEaWfP0PbzYFWvG28MXOOPAgWqD7nCS7CF4rTfdfArPs90Y8EqbVo3dVKrE
         OpKAA2yk9ZjWaQnP+anK7rWFYCkcNs2+Mq6REJa/zA2ShtVH2/ENDfysuVBkYAHYqtnF
         2CYs7TOl0BFrp718uCONqsZOKptVPhtObJ91XfMkVAS4leUDwUPlb0mHI3KYgutoG3hJ
         v5jhf6SJ077VB+iLajGrN/HcjcWp9FACN4SPFbAhab/nOvwaNuVfVnpGKj1rGqJD2LQ0
         8T3eR1b5WYQeZIWByycbFzDMvTNFu5UDcrg+bVpzNDefnyME48U6mqwuxPSV6/cZcLS6
         xIEw==
X-Gm-Message-State: APuU4Z9M/8ZY/o8O67W+CaaoWdOv8cebK3dyctOMHwKy98OT88qYihy/
	CYlImO4NpPiLgtzjWsul89LRuikf5WKJ90Q3Ux0w+i+aQD5sf65hw9OCpU3i9aE0BZf+LMDlqDk
	XNQRa+s+/k1j3HEAFURfU4UiRxkVdL9VgMC4//yPTwgxF+UPm+rLZi6UvM3HqzREcnN5Nhw==
X-Gm-Gg: AYBFou1LF5XDH9NQxyrBtnWs/Vg3Es2NSIR1FZ97bbAELYWZdNQnYbb4KMZK6GX/ynk
	osF0YfMN5vpXS/HUHmCXLiRmWoL6PUxC/ZQLg3PDO6gfYfUNgqGViAYto0CXvmJTMCdMD09INI8
	cDgykBNMOWSsrDI3m97nkOuPrHyOIKGU6STnAUSpN6EnEOtzDE/8xK0KYtSJTSBWTypZbmMyJOs
	wuVZ8ICixc5KDBjr/rlFv8+eha9tiL7S/lHoLALYCxPHZmawC8hPOhy4dIxgmsOg/6C716UEQuk
	Qj95550vxbNMttZOidl7oYm1VnC8dQdXteVKgdFWZerCtQ4uLOU0CetYqRyMSRwVVGkG+pRdJ0S
	ZcmKrPwLx52S3h3dQwEZNSMOZ88/sxFZ9hf6Vbk2tgZAr+5u5fMtD3VGPiCxzHmmbJR1F9B9wAz
	c3G2LncAsE8Q==
X-Received: by 2002:a05:693c:8845:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3751fe3228cmr1635691eec.32.1794285203066;
        Mon, 09 Nov 2026 20:33:23 -0800 (PST)
X-Received: by 2002:a05:693c:8845:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3751fe3228cmr1635642eec.32.1794285201890;
        Mon, 09 Nov 2026 20:33:21 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:21 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 10/19] wifi: nl80211/cfg80211: add support for NDP initiation in offload mode
Date: Tue, 10 Nov 2026 10:02:33 +0530
Message-Id: <20261110043242.2012238-11-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af29e94 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jW-vthIoXNXPAKLBysIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX5wfb4AmjjXfv
 nXkY9TLwMGrzzsbjUwmGDwqLvbbz2KksATR1kN6mShevF3zH3Scuc1Ly9iC8N/GCp+8R6jVewh2
 XcY9FoU8eZp3Z6o+vTExz92ZCIf5HyGFstVlHqQO9s3LDTQUhVxB2obNL2SXan/qNWGPJwf6rqe
 3ictEWyN57bLseHevDSFj9DanES1I3sZhjIdOM6abVzvCk5vjxv479yXdy/Ktec5EDpUZ/Qz6im
 kCHBqgeFtU91p+Y6grz9iNSVu0/V2YQzMmh+UdHzNZr/M10ocEi/1HkxrFGADKFh7KwZquSjXBn
 c6YMJ/dHg/2EMGj7sz4Qrpen3qFUD65YnqPuXpo1flRt+jmZ/6wADXPKqs6NjSal0u3N1lAfOiT
 lvV1jw8LfkmctQ+eoH9f8jKVReEaBpehPnyVJBPIZOpj4JyfieghnygvB+I4CjjSrJh0rN3015L
 9Ob0V+cMcIkk399qAzw==
X-Proofpoint-GUID: YGdkmvrEiRMU68wsu5e6pMGadXke-Fis
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXxvNfnQQHmjDz
 i/HK97SioxXz6XGfcXMQiFpkgD8AYXt+n6UungwGbdwzBCtgBGM6+x8FyJfgQ4J6a+VcWYYHhIM
 x46q+M2/OPJqNlGTJOGG8mmvbAeUfhA=
X-Proofpoint-ORIG-GUID: YGdkmvrEiRMU68wsu5e6pMGadXke-Fis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

Add NL80211_CMD_NAN_NDP_INITIATE to let userspace initiate a NAN Data
Path session when NDP management is offloaded to the device. Validate
that the initiator NDI exists locally, pass key material by pointer, and
apply the NAN security requirements to cipher suite, PMK, PMKID, and
GTK.

Let the initiator provide transport port and protocol information for
its service in the NDPE Service Info TLV. It can also request a
preferred NDL channel or require that the device include it. The device
chooses the bandwidth and reports setup failure if it cannot use a
forced channel.

Let the driver assign the NDP ID and return it in the command reply.
Clear the request skb after handling it because it may contain PMK data.
Trace the non-secret request parameters without recording PMK or PMKID
bytes.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  66 +++++++++
 include/uapi/linux/nl80211.h | 110 +++++++++++++++
 net/wireless/nl80211.c       | 263 +++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |  16 +++
 net/wireless/trace.h         |  94 +++++++++++++
 5 files changed, 549 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 60152bc5aa9a..eb753c83722e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4341,6 +4341,60 @@ struct cfg80211_nan_peer_sched {
 	struct cfg80211_nan_peer_map maps[CFG80211_NAN_MAX_PEER_MAPS];
 };
 
+/**
+ * struct cfg80211_nan_ndp_initiate - NAN NDP initiate parameters
+ *
+ * @peer_nmi: peer NMI address
+ * @publish_id: publisher's service instance ID
+ * @service_id: NAN service ID (%NL80211_NAN_FUNC_SERVICE_ID_LEN bytes)
+ * @init_ndi: initiator NDI MAC address. The corresponding
+ *	%NL80211_IFTYPE_NAN_DATA interface must exist.
+ * @ssi: service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @cipher_suite: NAN cipher suite ID, 0 for open NDP
+ * @pmk: ND-PMK used to derive the PTK; NULL if absent. Its length depends on
+ *	the cipher suite and is given by @pmk_len. Requires non-zero
+ *	@cipher_suite and %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @pmk_len: length of @pmk in bytes
+ * @pmkid: PMKID (16 octets) to include in the NDP Request, or NULL if absent
+ * @gtk_required: if true, GTK protection is required for group-addressed data
+ *	frames
+ * @gtk_cipher: GTK cipher suite ID, valid when @gtk_required is true
+ * @ipv6_intf_id: IPv6 link-local interface identifier, or NULL if absent
+ * @ndp_id: output NDP ID assigned by the driver on success (1-255)
+ * @transport_info: if true, convey @transport_port and @transport_protocol to
+ *	the peer in the NDPE Service Info TLV (Generic Service Protocol). These
+ *	values are not conveyed if the peer does not support NDPE.
+ * @transport_port: transport port to convey when @transport_info is true
+ * @transport_protocol: IANA protocol number to convey when @transport_info is
+ *	true
+ * @chan: preferred channel for the NDL, or NULL when the device chooses the
+ *	channels
+ * @chan_forced: if true, @chan must be included in the NDL; valid only when
+ *	@chan is non-NULL
+ */
+struct cfg80211_nan_ndp_initiate {
+	const u8 *peer_nmi;
+	u8 publish_id;
+	u8 service_id[NL80211_NAN_FUNC_SERVICE_ID_LEN];
+	const u8 *init_ndi;
+	const u8 *ssi;
+	u8 ssi_len;
+	u32 cipher_suite;
+	const u8 *pmk;
+	u8 pmk_len;
+	const u8 *pmkid;
+	bool gtk_required;
+	u32 gtk_cipher;
+	const u8 *ipv6_intf_id;
+	u8 ndp_id;
+	bool transport_info;
+	u16 transport_port;
+	u8 transport_protocol;
+	struct ieee80211_channel *chan;
+	bool chan_forced;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5322,6 +5376,15 @@ struct mgmt_frame_regs {
  *	supported when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device manages
  *	channel evacuation.
  *
+ * @nan_ndp_initiate: Initiate a NAN Data Path session as the initiator.
+ *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP.
+ *	The driver must set params->ndp_id to the assigned NDP ID (1-255) on
+ *	success. Each accepted setup attempt completes asynchronously with one
+ *	status notification, including on failure or timeout. If the parameters
+ *	specify a channel, drivers advertising NDP offload must honor it as a
+ *	channel preference. If the channel is forced and cannot be included in the
+ *	NDL, the driver must fail the request.
+ *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
  * @get_txq_stats: Get TXQ stats for interface or phy. If wdev is %NULL, this
@@ -5729,6 +5792,9 @@ struct cfg80211_ops {
 	int	(*nan_set_non_evac_channels)(struct wiphy *wiphy,
 					     struct wireless_dev *wdev,
 					     struct cfg80211_nan_non_evac_channels *channels);
+	int	(*nan_ndp_initiate)(struct wiphy *wiphy,
+				    struct wireless_dev *wdev,
+				    struct cfg80211_nan_ndp_initiate *params);
 	int	(*set_multicast_to_unicast)(struct wiphy *wiphy,
 					    struct net_device *dev,
 					    const bool enabled);
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 3406e37df5c4..d6b601556248 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1484,6 +1484,26 @@
  *	and multiple can be nested in %NL80211_ATTR_MLO_LINKS but then the
  *	update isn't atomic if any failures happen.
  *	Only supported with %NL80211_EXT_FEATURE_UPDATE_BEACON.
+ *
+ * @NL80211_CMD_NAN_NDP_INITIATE: Initiate NAN Data Path (NDP) setup
+ *	as the initiator. Requires %NL80211_NAN_CAPA_OFFLOAD_NDP,
+ *	%NL80211_ATTR_MAC (peer NMI), and %NL80211_ATTR_NAN_NDP. The NDI
+ *	interface specified in %NL80211_NAN_NDP_ATTR_INIT_NDI must already
+ *	exist as a %NL80211_IFTYPE_NAN_DATA interface. For a locally
+ *	initiated NDP, the driver assigns the NDP ID and returns it in the
+ *	%NL80211_ATTR_NAN_NDP reply.
+ *	%NL80211_NAN_NDP_ATTR_TRANSPORT_PORT and
+ *	%NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL may be supplied together to
+ *	include transport information in the NDPE Service Info TLV.
+ *	Without %NL80211_NAN_NDP_ATTR_CHANNEL_FREQ, the device chooses the
+ *	channels of the NDL. A supplied channel frequency is a preference unless
+ *	%NL80211_NAN_NDP_ATTR_CHANNEL_FORCED is also present; the device may then
+ *	use other channels. With %NL80211_NAN_NDP_ATTR_CHANNEL_FORCED, the device
+ *	must include the requested channel in the NDL or fail setup, reporting the
+ *	failure with %NL80211_CMD_NAN_NDP_STATUS. The device chooses the bandwidth.
+ *	Each accepted setup attempt completes asynchronously with exactly one
+ *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1766,6 +1786,8 @@ enum nl80211_commands {
 
 	NL80211_CMD_UPDATE_BEACON,
 
+	NL80211_CMD_NAN_NDP_INITIATE,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -3260,6 +3282,9 @@ enum nl80211_commands {
  * @NL80211_ATTR_ASSOC_PROTECTED_TWT: Enable protected TWT for the association,
  *	requires protected TWT support (flag attribute)
  *
+ * @NL80211_ATTR_NAN_NDP: nested attribute carrying NAN Data Path parameters.
+ *	See &enum nl80211_nan_ndp_attributes.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3867,6 +3892,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_ASSOC_PROTECTED_TWT,
 
+	NL80211_ATTR_NAN_NDP,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -8024,6 +8051,89 @@ enum nl80211_nan_conf_attributes {
 	NL80211_NAN_CONF_ATTR_MAX = NUM_NL80211_NAN_CONF_ATTR - 1,
 };
 
+#define NL80211_NAN_NDP_IPV6_INTF_ID_LEN	8
+
+/**
+ * enum nl80211_nan_ndp_attributes - NAN Data Path attributes
+ *
+ * Nested attributes used within %NL80211_ATTR_NAN_NDP for NDP setup commands
+ * and events.
+ *
+ * @__NL80211_NAN_NDP_ATTR_INVALID: Invalid.
+ * @NL80211_NAN_NDP_ATTR_ID: u8 NDP ID (1-255), assigned by the NDP initiator.
+ *	For locally initiated NDPs the driver assigns it and returns it in the
+ *	%NL80211_CMD_NAN_NDP_INITIATE reply; do not include it in that request.
+ * @NL80211_NAN_NDP_ATTR_PUBLISH_ID: u8 publisher's service instance ID, used
+ *	to match the NDP to a service.
+ * @NL80211_NAN_NDP_ATTR_SERVICE_ID: binary NAN service ID derived from the
+ *	service name, %NL80211_NAN_FUNC_SERVICE_ID_LEN bytes.
+ * @NL80211_NAN_NDP_ATTR_INIT_NDI: ETH_ALEN-byte initiator NDI MAC address.
+ *	For locally initiated NDPs, the corresponding
+ *	%NL80211_IFTYPE_NAN_DATA interface must exist.
+ * @NL80211_NAN_NDP_ATTR_RESP_NDI: ETH_ALEN-byte responder NDI MAC address.
+ * @NL80211_NAN_NDP_ATTR_SSI: binary. Service-specific info carried in
+ *	the NDP setup frames.
+ * @NL80211_NAN_NDP_ATTR_CIPHER_SUITE: u32 NAN cipher suite ID; 0 for open NDP.
+ *	See the Wi-Fi Aware Specification for values.
+ * @NL80211_NAN_NDP_ATTR_PMK: binary ND-PMK used to derive the PTK; its length
+ *	depends on the cipher suite. Requires non-zero
+ *	@NL80211_NAN_NDP_ATTR_CIPHER_SUITE and %NL80211_EXT_FEATURE_SECURE_NAN.
+ * @NL80211_NAN_NDP_ATTR_PMKID: 16-octet PMKID. In
+ *	%NL80211_CMD_NAN_NDP_INITIATE requests it identifies the PMK and is
+ *	included in the SCIA of the NDP Request. In a peer-request notification,
+ *	it carries the PMKID received in the peer's SCIA for cached-PMK lookup.
+ * @NL80211_NAN_NDP_ATTR_GTK_REQUIRED: flag indicating that GTK protection is
+ *	required for group-addressed data frames. Requires
+ *	@NL80211_NAN_NDP_ATTR_GTK_CIPHER; IGTK and BIGTK are not covered.
+ * @NL80211_NAN_NDP_ATTR_GTK_CIPHER: u32 GTK cipher suite ID. Required if
+ *	@NL80211_NAN_NDP_ATTR_GTK_REQUIRED is set.
+ * @NL80211_NAN_NDP_ATTR_IPV6_INTF_ID: binary IPv6 link-local interface
+ *	identifier, %NL80211_NAN_NDP_IPV6_INTF_ID_LEN bytes. The driver conveys it
+ *	in the NDPE attribute and selects NDP or NDPE based on peer capabilities.
+ * @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT: u16 transport port. Must be supplied
+ *	with @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL. The driver carries the pair
+ *	in the NDPE Service Info TLV (Generic Service Protocol). If the peer does
+ *	not support NDPE, the values are not conveyed.
+ * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
+ *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
+ * @NL80211_NAN_NDP_ATTR_CHANNEL_FREQ: optional u32 channel frequency in MHz.
+ *	Valid only with %NL80211_CMD_NAN_NDP_INITIATE. When supplied without
+ *	@NL80211_NAN_NDP_ATTR_CHANNEL_FORCED it is a preference, and the device
+ *	may use other channels for the NDL. Without this attribute, the device
+ *	chooses the NDL channels. The device chooses the channel bandwidth.
+ * @NL80211_NAN_NDP_ATTR_CHANNEL_FORCED: optional flag valid only with
+ *	%NL80211_CMD_NAN_NDP_INITIATE and
+ *	@NL80211_NAN_NDP_ATTR_CHANNEL_FREQ. The requested channel must be included
+ *	in the NDL. If it cannot be used, for example because it is incompatible
+ *	with peer availability, setup fails.
+ * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
+ * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
+ */
+enum nl80211_nan_ndp_attributes {
+	__NL80211_NAN_NDP_ATTR_INVALID,
+
+	NL80211_NAN_NDP_ATTR_ID,
+	NL80211_NAN_NDP_ATTR_PUBLISH_ID,
+	NL80211_NAN_NDP_ATTR_SERVICE_ID,
+	NL80211_NAN_NDP_ATTR_INIT_NDI,
+	NL80211_NAN_NDP_ATTR_RESP_NDI,
+	NL80211_NAN_NDP_ATTR_SSI,
+	NL80211_NAN_NDP_ATTR_CIPHER_SUITE,
+	NL80211_NAN_NDP_ATTR_PMK,
+	NL80211_NAN_NDP_ATTR_PMKID,
+	NL80211_NAN_NDP_ATTR_GTK_REQUIRED,
+	NL80211_NAN_NDP_ATTR_GTK_CIPHER,
+	NL80211_NAN_NDP_ATTR_IPV6_INTF_ID,
+	NL80211_NAN_NDP_ATTR_TRANSPORT_PORT,
+	NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
+	NL80211_NAN_NDP_ATTR_CHANNEL_FREQ,
+	NL80211_NAN_NDP_ATTR_CHANNEL_FORCED,
+
+	/* keep last */
+	__NL80211_NAN_NDP_ATTR_LAST,
+	NL80211_NAN_NDP_ATTR_MAX = __NL80211_NAN_NDP_ATTR_LAST - 1,
+};
+
 /**
  * enum nl80211_external_auth_action - Action to perform with external
  *     authentication request. Used by NL80211_ATTR_EXTERNAL_AUTH_ACTION.
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 4bcb62a0172f..fb1190a60748 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -800,6 +800,34 @@ nl80211_nan_peer_map_policy[NL80211_NAN_PEER_MAP_ATTR_MAX + 1] = {
 		NLA_POLICY_EXACT_LEN(CFG80211_NAN_SCHED_NUM_TIME_SLOTS),
 };
 
+static const struct nla_policy
+nl80211_nan_ndp_policy[NL80211_NAN_NDP_ATTR_MAX + 1] = {
+	[NL80211_NAN_NDP_ATTR_ID] = NLA_POLICY_RANGE(NLA_U8, 1, 255),
+	[NL80211_NAN_NDP_ATTR_PUBLISH_ID] = { .type = NLA_U8 },
+	[NL80211_NAN_NDP_ATTR_SERVICE_ID] =
+		NLA_POLICY_EXACT_LEN(NL80211_NAN_FUNC_SERVICE_ID_LEN),
+	[NL80211_NAN_NDP_ATTR_INIT_NDI] = NLA_POLICY_EXACT_LEN(ETH_ALEN),
+	[NL80211_NAN_NDP_ATTR_RESP_NDI] = NLA_POLICY_EXACT_LEN(ETH_ALEN),
+	[NL80211_NAN_NDP_ATTR_SSI] = {
+		.type = NLA_BINARY,
+		.len = NL80211_NAN_FUNC_SERVICE_SPEC_INFO_MAX_LEN
+	},
+	[NL80211_NAN_NDP_ATTR_CIPHER_SUITE] = { .type = NLA_U32 },
+	[NL80211_NAN_NDP_ATTR_PMK] =
+		NLA_POLICY_VALIDATE_FN(NLA_BINARY, validate_nan_pmk,
+				       WLAN_PMK_LEN_SUITE_B_192),
+	[NL80211_NAN_NDP_ATTR_PMKID] =
+		NLA_POLICY_EXACT_LEN(WLAN_PMKID_LEN),
+	[NL80211_NAN_NDP_ATTR_GTK_REQUIRED] = { .type = NLA_FLAG },
+	[NL80211_NAN_NDP_ATTR_GTK_CIPHER] = { .type = NLA_U32 },
+	[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID] =
+		NLA_POLICY_EXACT_LEN(NL80211_NAN_NDP_IPV6_INTF_ID_LEN),
+	[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT] = { .type = NLA_U16 },
+	[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL] = { .type = NLA_U8 },
+	[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ] = { .type = NLA_U32 },
+	[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED] = { .type = NLA_FLAG },
+};
+
 static const struct nla_policy
 nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_CLUSTER_ID] =
@@ -1226,6 +1254,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_NAN_MAX_CHAN_SWITCH_TIME] = { .type = NLA_U16 },
 	[NL80211_ATTR_NAN_PEER_MAPS] =
 		NLA_POLICY_NESTED_ARRAY(nl80211_nan_peer_map_policy),
+	[NL80211_ATTR_NAN_NDP] = NLA_POLICY_NESTED(nl80211_nan_ndp_policy),
 	[NL80211_ATTR_NPCA_PRIMARY_FREQ] = { .type = NLA_U32 },
 	[NL80211_ATTR_NPCA_PUNCT_BITMAP] =
 		NLA_POLICY_FULL_RANGE(NLA_U32, &nl80211_punct_bitmap_range),
@@ -18495,6 +18524,233 @@ static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
 	return rdev_nan_set_peer_sched(rdev, wdev, &sched);
 }
 
+static bool nl80211_nan_ndi_exists(struct cfg80211_registered_device *rdev,
+				   const u8 *addr)
+{
+	struct wireless_dev *wdev;
+
+	lockdep_assert_wiphy(&rdev->wiphy);
+
+	list_for_each_entry(wdev, &rdev->wiphy.wdev_list, list) {
+		if (wdev->iftype == NL80211_IFTYPE_NAN_DATA &&
+		    ether_addr_equal(wdev_address(wdev), addr))
+			return true;
+	}
+
+	return false;
+}
+
+static int nl80211_nan_ndp_initiate(struct sk_buff *skb,
+				    struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct wireless_dev *wdev = info->user_ptr[1];
+	struct nlattr *tb[NL80211_NAN_NDP_ATTR_MAX + 1], *ndp_attr;
+	struct cfg80211_nan_ndp_initiate params = {};
+	struct sk_buff *msg;
+	void *hdr;
+	bool secure_nan;
+	int err;
+
+	if (wdev->iftype != NL80211_IFTYPE_NAN) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP initiate requires NAN interface");
+		return -EOPNOTSUPP;
+	}
+
+	if (!(rdev->wiphy.nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP)) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN NDP offload not supported by driver");
+		return -EOPNOTSUPP;
+	}
+
+	if (!info->attrs[NL80211_ATTR_MAC] ||
+	    !info->attrs[NL80211_ATTR_NAN_NDP]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP initiate requires peer NMI and NDP params");
+		return -EINVAL;
+	}
+
+	err = nla_parse_nested(tb, NL80211_NAN_NDP_ATTR_MAX,
+			       info->attrs[NL80211_ATTR_NAN_NDP],
+			       nl80211_nan_ndp_policy,
+			       info->extack);
+	if (err)
+		return err;
+
+	if (!!tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT] !=
+	    !!tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "Transport port and protocol must be supplied together");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED] &&
+	    !tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ]) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED],
+				    "CHANNEL_FORCED requires CHANNEL_FREQ");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_ID]) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_ID],
+				    "NDP ID is assigned by the driver");
+		return -EINVAL;
+	}
+
+	if (!tb[NL80211_NAN_NDP_ATTR_INIT_NDI] ||
+	    !tb[NL80211_NAN_NDP_ATTR_PUBLISH_ID] ||
+	    !tb[NL80211_NAN_NDP_ATTR_SERVICE_ID]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP initiate requires INIT_NDI, PUBLISH_ID and SERVICE_ID");
+		return -EINVAL;
+	}
+
+	if (!nl80211_nan_ndi_exists(rdev,
+				    nla_data(tb[NL80211_NAN_NDP_ATTR_INIT_NDI]))) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_INIT_NDI],
+				    "INIT_NDI must identify an existing NAN Data interface");
+		return -ENODEV;
+	}
+
+	params.peer_nmi = nla_data(info->attrs[NL80211_ATTR_MAC]);
+	params.init_ndi = nla_data(tb[NL80211_NAN_NDP_ATTR_INIT_NDI]);
+	params.publish_id = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_PUBLISH_ID]);
+	memcpy(params.service_id,
+	       nla_data(tb[NL80211_NAN_NDP_ATTR_SERVICE_ID]),
+	       NL80211_NAN_FUNC_SERVICE_ID_LEN);
+	if (tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT]) {
+		params.transport_info = true;
+		params.transport_port =
+			nla_get_u16(tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PORT]);
+		params.transport_protocol =
+			nla_get_u8(tb[NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_SSI]) {
+		params.ssi = nla_data(tb[NL80211_NAN_NDP_ATTR_SSI]);
+		params.ssi_len = nla_len(tb[NL80211_NAN_NDP_ATTR_SSI]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE])
+		params.cipher_suite =
+			nla_get_u32(tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE]);
+
+	secure_nan = wiphy_ext_feature_isset(&rdev->wiphy,
+					     NL80211_EXT_FEATURE_SECURE_NAN);
+	if (params.cipher_suite && !secure_nan) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_CIPHER_SUITE],
+				    "NDP cipher suite requires SECURE_NAN");
+		return -EOPNOTSUPP;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_PMK] ||
+	    tb[NL80211_NAN_NDP_ATTR_PMKID] ||
+	    tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED]) {
+		if (!secure_nan || !params.cipher_suite) {
+			NL_SET_ERR_MSG(info->extack,
+				       "PMK, PMKID, and GTK require SECURE_NAN and a non-zero cipher suite");
+			return -EINVAL;
+		}
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_PMK]) {
+		params.pmk = nla_data(tb[NL80211_NAN_NDP_ATTR_PMK]);
+		params.pmk_len = nla_len(tb[NL80211_NAN_NDP_ATTR_PMK]);
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_PMKID])
+		params.pmkid = nla_data(tb[NL80211_NAN_NDP_ATTR_PMKID]);
+
+	if (tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED]) {
+		if (!tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_GTK_REQUIRED],
+					    "GTK_CIPHER is required when GTK_REQUIRED is set");
+			return -EINVAL;
+		}
+
+		params.gtk_required = true;
+		params.gtk_cipher =
+			nla_get_u32(tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]);
+	} else if (tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER]) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_NAN_NDP_ATTR_GTK_CIPHER],
+				    "GTK_CIPHER requires GTK_REQUIRED");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID])
+		params.ipv6_intf_id =
+			nla_data(tb[NL80211_NAN_NDP_ATTR_IPV6_INTF_ID]);
+
+	if (tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ]) {
+		u32 freq = nla_get_u32(tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ]);
+
+		params.chan = ieee80211_get_channel(&rdev->wiphy, freq);
+		if (!params.chan) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ],
+					    "Channel frequency is not supported");
+			return -EINVAL;
+		}
+		if (params.chan->flags & IEEE80211_CHAN_DISABLED) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ],
+					    "Channel is disabled");
+			return -EINVAL;
+		}
+		if (!(rdev->wiphy.nan_supported_bands &
+		      BIT(params.chan->band))) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_NAN_NDP_ATTR_CHANNEL_FREQ],
+					    "Channel band is not supported for NAN");
+			return -EOPNOTSUPP;
+		}
+		params.chan_forced =
+			!!tb[NL80211_NAN_NDP_ATTR_CHANNEL_FORCED];
+	}
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = nl80211hdr_put(msg, info->snd_portid, info->snd_seq, 0,
+			     NL80211_CMD_NAN_NDP_INITIATE);
+	if (!hdr) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	err = rdev_nan_ndp_initiate(rdev, wdev, &params);
+	if (err) {
+		nlmsg_free(msg);
+		return err;
+	}
+
+	if (WARN_ON_ONCE(!params.ndp_id)) {
+		nlmsg_free(msg);
+		return -EINVAL;
+	}
+
+	ndp_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_NDP);
+	if (!ndp_attr ||
+	    nla_put_u8(msg, NL80211_NAN_NDP_ATTR_ID, params.ndp_id))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, ndp_attr);
+	genlmsg_end(msg, hdr);
+	return genlmsg_reply(msg, info);
+
+nla_put_failure:
+	nlmsg_free(msg);
+	return -ENOBUFS;
+}
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
@@ -21656,6 +21912,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_NETDEV_UP |
 					 NL80211_FLAG_NO_WIPHY_MTX),
 	},
+	{
+		.cmd = NL80211_CMD_NAN_NDP_INITIATE,
+		.doit = nl80211_nan_ndp_initiate,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
+					 NL80211_FLAG_CLEAR_SKB),
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 7b8440c1f697..df8ec338e59d 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1189,6 +1189,22 @@ static inline void rdev_stop_pd(struct cfg80211_registered_device *rdev,
 	trace_rdev_return_void(&rdev->wiphy);
 }
 
+static inline int
+rdev_nan_ndp_initiate(struct cfg80211_registered_device *rdev,
+		      struct wireless_dev *wdev,
+		      struct cfg80211_nan_ndp_initiate *params)
+{
+	int ret;
+
+	if (!rdev->ops->nan_ndp_initiate)
+		return -EOPNOTSUPP;
+
+	trace_rdev_nan_ndp_initiate(&rdev->wiphy, wdev, params);
+	ret = rdev->ops->nan_ndp_initiate(&rdev->wiphy, wdev, params);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+	return ret;
+}
+
 static inline int rdev_set_mac_acl(struct cfg80211_registered_device *rdev,
 				   struct net_device *dev,
 				   struct cfg80211_acl_data *params)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 31000ffebe43..131fb5657004 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2552,6 +2552,100 @@ TRACE_EVENT(rdev_nan_set_non_evac_channels,
 				__entry->n_channels, sizeof(u32)))
 );
 
+#define RDEV_NAN_NDP_INITIATE_FMT_1 \
+	", peer: %pM, init_ndi: %pM, publish_id: %u, "
+#define RDEV_NAN_NDP_INITIATE_FMT_2 \
+	"service_id: %s, ssi_len: %u, ssi: %s, "
+#define RDEV_NAN_NDP_INITIATE_FMT_3 \
+	"cipher_suite: %u, pmk_len: %u, pmkid_present: %d, "
+#define RDEV_NAN_NDP_INITIATE_FMT_4 \
+	"gtk_required: %d, gtk_cipher: %u, ipv6_intf_id_present: %d, "
+#define RDEV_NAN_NDP_INITIATE_FMT_5 \
+	"ipv6_intf_id: %s, channel_freq: %u, channel_forced: %d"
+TRACE_EVENT(rdev_nan_ndp_initiate,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 struct cfg80211_nan_ndp_initiate *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, publish_id)
+		__array(u8, service_id, NL80211_NAN_FUNC_SERVICE_ID_LEN)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(u32, cipher_suite)
+		__field(u8, pmk_len)
+		__field(bool, pmkid_present)
+		__field(bool, gtk_required)
+		__field(u32, gtk_cipher)
+		__field(bool, transport_info)
+		__field(u16, transport_port)
+		__field(u8, transport_protocol)
+		__field(bool, ipv6_intf_id_present)
+		__array(u8, ipv6_intf_id, NL80211_NAN_NDP_IPV6_INTF_ID_LEN)
+		__field(u32, channel_freq)
+		__field(bool, channel_forced)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		__entry->publish_id = params->publish_id;
+		memcpy(__entry->service_id, params->service_id,
+		       NL80211_NAN_FUNC_SERVICE_ID_LEN);
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
+		__entry->cipher_suite = params->cipher_suite;
+		__entry->pmk_len = params->pmk ? params->pmk_len : 0;
+		__entry->pmkid_present = !!params->pmkid;
+		__entry->gtk_required = params->gtk_required;
+		__entry->gtk_cipher = params->gtk_cipher;
+		__entry->transport_info = params->transport_info;
+		__entry->transport_port = params->transport_port;
+		__entry->transport_protocol = params->transport_protocol;
+		__entry->ipv6_intf_id_present = !!params->ipv6_intf_id;
+		if (params->ipv6_intf_id)
+			memcpy(__entry->ipv6_intf_id, params->ipv6_intf_id,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+		else
+			memset(__entry->ipv6_intf_id, 0,
+			       NL80211_NAN_NDP_IPV6_INTF_ID_LEN);
+		__entry->channel_freq = params->chan ?
+			params->chan->center_freq : 0;
+		__entry->channel_forced = params->chan_forced;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  RDEV_NAN_NDP_INITIATE_FMT_1 RDEV_NAN_NDP_INITIATE_FMT_2
+		  RDEV_NAN_NDP_INITIATE_FMT_3 RDEV_NAN_NDP_INITIATE_FMT_4
+		  RDEV_NAN_NDP_INITIATE_FMT_5
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->init_ndi,
+		  __entry->publish_id,
+		  __print_array(__entry->service_id,
+				NL80211_NAN_FUNC_SERVICE_ID_LEN, sizeof(u8)),
+		  __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->cipher_suite, __entry->pmk_len,
+		  __entry->pmkid_present, __entry->gtk_required,
+		  __entry->gtk_cipher, __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->channel_freq, __entry->channel_forced,
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef RDEV_NAN_NDP_INITIATE_FMT_1
+#undef RDEV_NAN_NDP_INITIATE_FMT_2
+#undef RDEV_NAN_NDP_INITIATE_FMT_3
+#undef RDEV_NAN_NDP_INITIATE_FMT_4
+#undef RDEV_NAN_NDP_INITIATE_FMT_5
+
 TRACE_EVENT(rdev_set_mac_acl,
 	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev,
 		 struct cfg80211_acl_data *params),
-- 
2.34.1

