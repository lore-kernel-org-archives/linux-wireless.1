Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565407;
	b=QvkD3+0gpvOjp9z9TtWqcmPb0HpSFIuyXbCatfhupteaj28HpPyvDwlifj29+GxFIhuG
	 MZTVMexhyfExkUyjUXuzQacNHDsokwSUHaJSgJTnz11FItpHdw9gFsGYVaYBv7fzE+WwT
	 XCfBWR095aDkWEaK8z3J7W5mwh+U+CdoWsr7uJV3EApbxjCqBkZO0L+JfwB9/EuxWoX+Z
	 RmwA9MsPMcyZjCaE9NyjqGt8GxGj95ccesN7ODt0EE6ythwVlsDa/LhybxYta+leKKPcR
	 AhgMhJpxjrYDtc7lSFYerTWmg+u3XFPmgzDM1f1cfrKvAA5UZwHJi1XSClXtIpNNR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
	b=gmU8vLL19/fH7w2xvtTMd8YqXnv+HfFPaPSfHPQGfeqEKpaorsxT/S+b/EldHmFnmQmp
	 D+v2Ys1VH0Ce0tdvli36Wrn/KgBdzoLycBUPwIjyT3sWECMS0ds/2Md7fMqiFi/EsT3Ej
	 KgRQkVPRcvuinY9CiF+1dYlFOoG/OZEocqFvSyNa+B14uRiUUGXpIla76l0l6s/aZnAUV
	 nbfqxvbQBA8xmXIgAVbLVwKqEV8xmc1fQcN1MIgoNAhO9NFTxuopba9hcS3bjtj8RVY+v
	 Rev+SdU83aXr+kx/f4R/7Pn7Qk7EbEkguR59qIFEaAvhW2LZB/mR9A/ZEVT8lYaPZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bu2aa/LC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjOwkIah;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C922A60A2610
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C922A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bu2aa/LC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KjOwkIah
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uw5n3619872
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ve0+Umiqjo0
	RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=; b=Bu2aa/LC8aSEcvyXSkS4y248E8e
	FTa2Hr2h1smxEvmiHKXK4zEcGy1aN9kJ/NV0ImOWgsJihKHHBI9MegbtksiGccly
	SDmX1E9jNLfa80K6Osjq/nNTCN0Y5FeJog5wYguuzSKGkzg3iWRMJy/cVtCvCma1
	mlrUNUDkgCTQrDRBIq+3bTm7meOVeMorabmFf83ljYRRwYTMjVZNqez37Lnldk1f
	+JpeyQ24V4TMclZ99kHTHWjlt3MwTPTLaQhhMCtJtx8TcM0UNHjnNehDBsVcwy7K
	+SxwzBd7dw74R++aivEbP8/hOcIsHmraAtm/E555beYezpPk1hbqFCmOJnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8xap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so463466eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565405; x=1795170205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
        b=KjOwkIahfQyUFYZ+HknweA2fmbZjPUzxFn/gM7FDf59T003Phbih2uKZNebKtHNEQt
         H0rzujIigO0MzYZlw+uXlcHZ0Z0y+lcX7NCRGQ3SdZEIdCicp3LXyP/Xf6VPSGtM4OqO
         VRFYRnZzXltW0L70/0nZ7ct92li907UqBttgNpHABxVnYoKsbHM8jPFWQEFL6T6IqpwU
         c6PZej4+8rGZlUbKUh//oRLszXJmHkNKolUG/E9c2LpwgCkwbU2gFmn/t1AjR4Bxio6y
         7t/IqI29gDOmOZG6sO4Dt/A1qZVTSXnhJRH6jJ+TuwH4HL6QRORrPJBL5Oi0IcKl6KrN
         yJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565405; x=1795170205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve0+Umiqjo0RplnNI1mpQ0AdQ0vzTTTWkgBKglgZmUg=;
        b=IzmwXETP5LrKqbau4wcuqXXNCIFTGwfp/6c/nzZV8Ha2GiC/flvtFK1DP9WMIhlOdL
         KNMc114ozc836Ko9KE4HWyeCev73JAISVB3mkninvTSzzqwpKnZOGrbgoeJMoeMONU+I
         0Tj1VgqoEn/XqGP4OAzId2wc4JVNgIJUKJ27T6pNorvTPBruq2h16QCZPUF+1DiQtEYh
         LI4UUaA2zONMefHlZjbpxA3jNWRPr6RyEjsSGoUeG7moDl5x8mdzEC0vwduyqp3bQWqy
         I9XCQ+6fw+4osd4UeJ3Cpk2DYWDvGZNpT+na3xd1MqDM13f0sBa4BnyQZ7Nu2BILIE0c
         XjYQ==
X-Gm-Message-State: APuU4Z/ba3ldphyuM9TGx0Sowy2cZXVs5sqfB9gEY6Blpo2ZCtjj7TsX
	aRLsLJUuUzyBL6ll7TtNE/hTnfBTYhA+b3xdiCaMaYgunwCirq2QXNj+EZj8tRsrE89xQUTLMLu
	vxQ0j/xtU2sUpUF6TLjFm5ufz4y9mtf8U35AuM/IzUG5qJ/jK6Ntk7l1I8m4G0BUYqPaUp6Jf3n
	GwIA==
X-Gm-Gg: AYBFou3zASEjbyGZh6Fcbo6WGAmlNwNHdby/eNSQiQFoR/i+2kREbaamEgnQT3i4QC0
	eT5wOhEDpUTgzvg8FffrIX/XaXJ7l4F1oQuFHW+oEJlPRSI71XatYrMrClvenIdb57Hwphgv7Eb
	lSnBo+3Rm43uRPv3M0vdiiaQBMho21618enqP06AY69t5GgU9JZkoCwRBVlg4gHES32VJlVgEle
	q/VNAr9anSYbrqCcTi4BzMtP+4OcIq0JDpffszy0nDUazOHiBJOzGeYTdIZ2puCNBGEX41O8WOU
	NVZpY6P9BvvUbCz/pTSq43cvzmkFph13fejjItjWHABOf0dhCRQQFMCE74mE6o14Gvxv8RBe9F/
	dNlkLZJHg1JInSM8gW9PsbOBSpS1x7rUi1JtgHwTnqb1ihbtfErzbdqWsTzdqxwUi+QHorcAveB
	k17yF83FdsIU4=
X-Received: by 2002:a05:7300:d402:b0:357:ee3a:267a with SMTP id 5a478bee46e88-37963565cb0mr1711420eec.2.1794565404982;
        Fri, 13 Nov 2026 02:23:24 -0800 (PST)
X-Received: by 2002:a05:7300:d402:b0:357:ee3a:267a with SMTP id 5a478bee46e88-37963565cb0mr1711406eec.2.1794565404341;
        Fri, 13 Nov 2026 02:23:24 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:24 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 14/19] wifi: nl80211/cfg80211: add support for NDP status indication
Date: Fri, 13 Nov 2026 15:52:23 +0530
Message-Id: <20261113102228.1917973-15-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-GUID: BHHdEyMJ494AjJPjl44taTnweuu0JNqG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX9+4L0mIw0ISm
 4/IyEnQuGEp9rHlAMF8ND2Oa2kWEiwMQEDA+G/UK6ICOPQEoUfvUh0U8JUS5KbHqYjFpBHJIU3z
 xCOXckcWMlavQTrlDAfEp3A8J7852/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXzssgKD/91EED
 YkfSQzsWazQ4LCZwthAgqvEJ0pcZEq6NmqfmbyCcj403QGEX9ri3SSwyLz+vKyOftJK5yfvkVyZ
 WQCyy01tW76HwQYxWsqOIruAh0Tc2+yi61icviIixiQRHZWZ/tGRcOA7Wyzf0nM2UB/mYm6Dzen
 z4iYNjK9yl843M18C/u5vWIw5taoWAn3C+pMp0AFM1EuadWh4kdRC3r/avR3qaArx3qyxIJFBMz
 zFFpw8iGDEvrnpTNYMp+05JfovJuTklM8++3JY0h2csttsvHUvJePktH9X87l43Sx3ATx6nPmU8
 3TPvdUml0nIRb2z3ubuZOnmNmrN+mxgXkf0KAYQ58WtsGerML/A59Dz8TvorS//JEM6S181krD0
 VxSLy+4h+tWzYzmFSoninMxtJL9/QmGMzO0D8EkxM/8RCi5jht9pVIX50PNayIvxMwz1I9KHomo
 pX8y/bzGIjsu4o9kBpA==
X-Proofpoint-ORIG-GUID: BHHdEyMJ494AjJPjl44taTnweuu0JNqG
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6e51e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KIs_r_sxcAyzomjtXGYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

Add NL80211_CMD_NAN_NDP_STATUS to notify both NDP peers when setup
finishes. Use the ACCEPT flag to indicate successful setup and include
the responder NDI on success; report the rejection or failure reason
otherwise.

Add cfg80211_nan_ndp_status() and its parameter structure, validate the
notification parameters, trace the status without key material, and
deliver it to the NAN owner or multicast group. Include the transport
port and protocol received from the peer when present.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 53 +++++++++++++++++++++++
 include/uapi/linux/nl80211.h | 23 ++++++++--
 net/wireless/nl80211.c       | 81 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 73 ++++++++++++++++++++++++++++++++
 4 files changed, 226 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index caff65d0c801..6c3902939132 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4550,6 +4550,43 @@ struct cfg80211_nan_ndp_request_params {
 	u8 transport_protocol;
 };
 
+/**
+ * struct cfg80211_nan_ndp_status_params - NAN NDP status event parameters
+ *
+ * Sent exactly once to userspace for each NDP setup attempt, after the driver
+ * completes setup successfully, fails it, or times it out. This covers both
+ * locally initiated NDPs and peer requests reported to userspace.
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID
+ * @init_ndi: initiator NDI MAC address
+ * @resp_ndi: responder NDI MAC address (valid when @accepted is true)
+ * @accepted: if true, NDP setup succeeded; if false, setup failed
+ * @reason: Wi-Fi Aware reason code for failure (valid when @accepted is false)
+ * @ssi: response service-specific info (may be NULL)
+ * @ssi_len: length of @ssi
+ * @ipv6_intf_id: peer's IPv6 link-local interface identifier, or NULL if absent
+ * @transport_info: if true, the peer included transport information
+ * @transport_port: transport port received from the peer when
+ *	@transport_info is true
+ * @transport_protocol: IANA protocol number received from the peer when
+ *	@transport_info is true
+ */
+struct cfg80211_nan_ndp_status_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	const u8 *resp_ndi;
+	bool accepted;
+	u8 reason;
+	const u8 *ssi;
+	u8 ssi_len;
+	const u8 *ipv6_intf_id;
+	bool transport_info;
+	u16 transport_port;
+	u8 transport_protocol;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -11729,6 +11766,22 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
 			      const struct cfg80211_nan_ndp_request_params *params,
 			      gfp_t gfp);
 
+/**
+ * cfg80211_nan_ndp_status - notify userspace that NDP setup is complete
+ * @wdev: the wireless device reporting the event
+ * @params: NDP status parameters
+ * @gfp: allocation flags
+ *
+ * Notify userspace that NAN Data Path setup is complete. Includes the
+ * setup status and, if successful, the responder NDI. Call exactly once for
+ * every locally initiated setup attempt and every indicated peer request,
+ * including failure and timeout (for example, when the peer does not respond).
+ * Only valid when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ */
+void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
+			     const struct cfg80211_nan_ndp_status_params *params,
+			     gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 5c2dbe4f1463..a0d0d77346d4 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1617,6 +1617,17 @@
  *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
  *	The command reply acknowledges the request; teardown completion is
  *	reported asynchronously by the termination notification.
+ * @NL80211_CMD_NAN_NDP_STATUS: Notification-only event sent to userspace on
+ *	the initiator and responder sides when NDP setup finishes, successfully or
+ *	not. If %NL80211_NAN_NDP_ATTR_ACCEPT is present, setup succeeded and
+ *	%NL80211_NAN_NDP_ATTR_RESP_NDI is present; otherwise the notification
+ *	carries %NL80211_NAN_NDP_ATTR_REASON. Also carries %NL80211_ATTR_MAC and
+ *	%NL80211_ATTR_NAN_NDP. Exactly one status notification is sent for each
+ *	setup attempt, whether initiated locally or from an indicated peer request.
+ *	It is sent after success, failure, or timeout, including when the peer does
+ *	not respond.
+ *	%NL80211_ATTR_NAN_NDP, including transport information when it was
+ *	included by the peer.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1908,6 +1919,7 @@ enum nl80211_commands {
 	NL80211_CMD_NAN_NDP_INITIATE,
 	NL80211_CMD_NAN_NDP_RESPOND,
 	NL80211_CMD_NAN_NDP_TERMINATE,
+	NL80211_CMD_NAN_NDP_STATUS,
 
 	/* add new commands above here */
 
@@ -8218,8 +8230,8 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_INITIATE and in an accepting
  *	%NL80211_CMD_NAN_NDP_RESPOND. The driver carries these values in the NDPE
  *	Service Info TLV (Generic Service Protocol). If the peer does not support
- *	NDPE, these values are not conveyed. Peer-request notifications include
- *	the pair when it was included by the peer.
+ *	NDPE, these values are not conveyed. Peer-request and status notifications
+ *	include the pair when it was included by the peer.
  * @NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL: u8 IANA protocol number. Must be
  *	supplied with @NL80211_NAN_NDP_ATTR_TRANSPORT_PORT.
  * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
@@ -8234,10 +8246,13 @@ enum nl80211_nan_conf_attributes {
  *	%NL80211_CMD_NAN_NDP_RESPOND.
  * @NL80211_NAN_NDP_ATTR_ACCEPT: flag. If present in
  *	%NL80211_CMD_NAN_NDP_RESPOND, it accepts the request; if absent, it is
- *	rejected.
+ *	rejected. In %NL80211_CMD_NAN_NDP_STATUS it indicates setup succeeded and
+ *	@NL80211_NAN_NDP_ATTR_RESP_NDI is present.
  * @NL80211_NAN_NDP_ATTR_REASON: u8 Wi-Fi Aware reason code, not an IEEE 802.11
  *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
- *	%NL80211_CMD_NAN_NDP_RESPOND.
+ *	%NL80211_CMD_NAN_NDP_RESPOND, setup failure with
+ *	%NL80211_CMD_NAN_NDP_STATUS, or termination with
+ *	%NL80211_CMD_NAN_NDP_TERMINATE.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index c9b7a5b4600a..f0f25aa71b22 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19081,6 +19081,87 @@ void cfg80211_nan_ndp_request(struct wireless_dev *wdev,
 }
 EXPORT_SYMBOL(cfg80211_nan_ndp_request);
 
+void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
+			     const struct cfg80211_nan_ndp_status_params *params,
+			     gfp_t gfp)
+{
+	struct wiphy *wiphy = wdev->wiphy;
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
+	struct nlattr *ndp_attr;
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (WARN_ON_ONCE(!params->peer_nmi || !params->init_ndi ||
+			 !params->ndp_id || wdev->iftype != NL80211_IFTYPE_NAN ||
+			 !(wiphy->nan_capa.flags &
+			   WIPHY_NAN_FLAGS_OFFLOAD_NDP)))
+		return;
+
+	if (WARN_ON_ONCE(params->accepted && !params->resp_ndi))
+		return;
+
+	trace_cfg80211_nan_ndp_status(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_STATUS);
+	if (!hdr)
+		goto nla_put_failure;
+
+	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+	    nla_put_u64_64bit(msg, NL80211_ATTR_WDEV, wdev_id(wdev),
+			      NL80211_ATTR_PAD) ||
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, params->peer_nmi))
+		goto nla_put_failure;
+
+	ndp_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_NDP);
+	if (!ndp_attr)
+		goto nla_put_failure;
+
+	if (nla_put_u8(msg, NL80211_NAN_NDP_ATTR_ID, params->ndp_id) ||
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_INIT_NDI, ETH_ALEN,
+		    params->init_ndi))
+		goto nla_put_failure;
+
+	if (params->accepted) {
+		if (nla_put_flag(msg, NL80211_NAN_NDP_ATTR_ACCEPT) ||
+		    nla_put(msg, NL80211_NAN_NDP_ATTR_RESP_NDI, ETH_ALEN,
+			    params->resp_ndi))
+			goto nla_put_failure;
+	} else if (nla_put_u8(msg, NL80211_NAN_NDP_ATTR_REASON,
+			      params->reason)) {
+		goto nla_put_failure;
+	}
+
+	if (params->ssi && params->ssi_len &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_SSI, params->ssi_len,
+		    params->ssi))
+		goto nla_put_failure;
+
+	if (params->ipv6_intf_id &&
+	    nla_put(msg, NL80211_NAN_NDP_ATTR_IPV6_INTF_ID,
+		    NL80211_NAN_NDP_IPV6_INTF_ID_LEN, params->ipv6_intf_id))
+		goto nla_put_failure;
+
+	if (params->transport_info &&
+	    (nla_put_u16(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PORT,
+			 params->transport_port) ||
+	     nla_put_u8(msg, NL80211_NAN_NDP_ATTR_TRANSPORT_PROTOCOL,
+			params->transport_protocol)))
+		goto nla_put_failure;
+
+	nla_nest_end(msg, ndp_attr);
+	genlmsg_end(msg, hdr);
+	nl80211_send_nan_ndp_event(wdev, msg, gfp);
+	return;
+
+nla_put_failure:
+	nlmsg_free(msg);
+}
+EXPORT_SYMBOL(cfg80211_nan_ndp_status);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index be7b3162c821..7c3d8b3ac94f 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4773,6 +4773,79 @@ TRACE_EVENT(cfg80211_nan_ndp_request,
 #undef CFG80211_NDP_REQUEST_FMT_4
 #undef CFG80211_NDP_REQUEST_FMT_5
 
+#define CFG_NDP_STATUS_FMT_1 \
+	", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, "
+#define CFG_NDP_STATUS_FMT_2 \
+	"resp_ndi: %pM, accepted: %d, reason: %u, ssi_len: %u, "
+#define CFG_NDP_STATUS_FMT_3 \
+	"ssi: %s, ipv6_intf_id_present: %d, ipv6_intf_id: %s"
+
+TRACE_EVENT(cfg80211_nan_ndp_status,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_status_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__array(u8, resp_ndi, ETH_ALEN)
+		__field(bool, accepted)
+		__field(u8, reason)
+		__field(u8, ssi_len)
+		__dynamic_array(u8, ssi, params->ssi_len)
+		__field(bool, transport_info)
+		__field(u16, transport_port)
+		__field(u8, transport_protocol)
+		__field(bool, ipv6_intf_id_present)
+		__array(u8, ipv6_intf_id, NL80211_NAN_NDP_IPV6_INTF_ID_LEN)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		if (params->resp_ndi)
+			memcpy(__entry->resp_ndi, params->resp_ndi, ETH_ALEN);
+		else
+			memset(__entry->resp_ndi, 0, ETH_ALEN);
+		__entry->accepted = params->accepted;
+		__entry->reason = params->reason;
+		__entry->ssi_len = params->ssi_len;
+		if (params->ssi && params->ssi_len)
+			memcpy(__get_dynamic_array(ssi), params->ssi,
+			       params->ssi_len);
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
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  CFG_NDP_STATUS_FMT_1 CFG_NDP_STATUS_FMT_2 CFG_NDP_STATUS_FMT_3
+		  ", transport_info: %d, transport_port: %u, transport_protocol: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi, __entry->ndp_id,
+		  __entry->init_ndi, __entry->resp_ndi, __entry->accepted,
+		  __entry->reason, __entry->ssi_len,
+		  __print_array(__get_dynamic_array(ssi), __entry->ssi_len,
+				sizeof(u8)),
+		  __entry->ipv6_intf_id_present,
+		  __print_array(__entry->ipv6_intf_id,
+				NL80211_NAN_NDP_IPV6_INTF_ID_LEN, sizeof(u8)),
+		  __entry->transport_info, __entry->transport_port,
+		  __entry->transport_protocol)
+);
+#undef CFG_NDP_STATUS_FMT_1
+#undef CFG_NDP_STATUS_FMT_2
+#undef CFG_NDP_STATUS_FMT_3
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

