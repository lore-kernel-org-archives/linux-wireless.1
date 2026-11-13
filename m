Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565397;
	b=aoFCxBDMwIDq49Uahv/WtNW5CjhJKyUFAPve0wlIj9zLqc7yLBy+2PgeI2v8Vz7hEibN
	 VL4nCKbUvKA0/OkVNz31MTkq4t71/Gwb5LdA9dcR3yEHUMG1IViNPhXGEJHumYKGyrnY9
	 nHii5Bzd8/lcyJNrCRnAwmho3ekUcuDFdHkiP4kYMmderGSdqW/DUht/GlF7KXqJY/vCE
	 LL2lvPTxMEWPqtv+ouemTGClBpIyjB3rww5xOCXrIg6h4uypA5vzJiFGsM2mscHF7NJcU
	 7zna4e+Xx/1reLRdZbzYhLfaZoMGMnlHy+975QOWhKhjpmRVvEvwC9Sl8WROGuKz4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ohW7Mgj+W4b4XRFreMQfi1pZatqbZCgQp00lV3xHb/8=;
	b=X+ulOrskYDj9McC31TlTLWQ1DXs7q7qI1Y8LqujaGLikQ23h5NxGXwh1dnIsV4gU3Do9
	 x/BtaOvrtJfFPjtKmrq+7O7SmChcUga1TQmtuCRaviG8I61hXaf5zhMijZSH6WPw026IC
	 bRV3ZBQQEhBDgpisYUMbpvvvo8vqVyFnqZoFyaNnE2icjro6/S7eSc+HjUcbEMVjyMh7h
	 8A/pi751X1fXdLYX/dPJuxDh3BqhRSb4xkbdpdtFBHy8C/14yHsQ5czuqLipWpkvfOYS+
	 zLf5wtZhpRuPNughzYdQ/aaRLV5y0Q4nDVsejrpEvd5EPNC7J+8dNVMNZqH2y96gmWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7iSzy4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OC1PRJBq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1E606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD1E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7iSzy4P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OC1PRJBq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VMMr2515758
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ohW7Mgj+W4b
	4XRFreMQfi1pZatqbZCgQp00lV3xHb/8=; b=j7iSzy4PMKy1nAF3pXhb03SqRUE
	J1IhCYpgKMIZnfDkb2Mo/xA9v7ge/RKQq30J5be6HwGC+6fHzXuckdNy9HBKkiUO
	VfgDnoB55SmTzBswDG1Y0Ox6ZDoWSBbEQaqn10JS9rGEBhnv2sdsW8NzBEQ8WKcW
	rztGCH5gRLRlFKv0s8YiwBycUxwo067xnOpr0gezhTdTQkXaOA+7fauNgHXMMjwW
	GEfrloXio68XE6x1L5pmD99//argHmZZ4nUiEYQILm5/TPlgdVYVu05FmjofRvHl
	CU8sVQxEtAenRhgK6CDhLK/oqTxZ6iRADIf9nFMccWp9fjJRSSaj0SXjL7A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbkn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1255249eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565395; x=1795170195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohW7Mgj+W4b4XRFreMQfi1pZatqbZCgQp00lV3xHb/8=;
        b=OC1PRJBq7etrgfytm18uFHERrUGBDqzUAVZApe/ut4unZWQJnoVqWaQVv780bzVAc0
         xVTfjqQvB5GLQ4GvEg2atahgnA7GXIIp3WVz26ICWaIPlQVQvI9dG4mS88VsX2UXCvNF
         3lLOxbyR/JknS3MIO0uWWVEdxlXLTJ+16tk0/0zXda1ztU86i5ZyZj0G3ipuPBDWxoJF
         3iQHv4prE8F7OonZDOzXK5eW5O7lXLolAGKqFCaBbkYcGQKwG51VzlnapQWEkMbfp+s+
         oDizshO2+Gla1DfcENuCeHbYeLmr1YPi1j2a2b+vOMiIHtoCjFeBQJqie/U7jK+EszGU
         TbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565395; x=1795170195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohW7Mgj+W4b4XRFreMQfi1pZatqbZCgQp00lV3xHb/8=;
        b=ld6CnqZxDoIpwkPOfrCL7dYZyLVCW0OAg0UFJVdpPl0D+26DZdhCxBY383bsb+YRGK
         OxewPb3ARLy5WQ15+7ZbFCF2zftAX7gZjaS17hXgiqWD66xQhcZG134wKVohdB3rtFbC
         Q/e6AGLkldXKEDNIYiABegK6xroB5F0Kxx80TqmswduiFKSDEDlQxpgndO8REq18SeMq
         pJWDsogp4kvZP8d+8A54xBwcVD7dJfWfIwLrqIhfls7Mcu7RD/R2QCuQZccfU/LY7FpN
         CNdyxDl5kGKyNG6p/p3P7eNfnDgsWZ0XxRvlLw4aPL1E+PHx6CmvmsR5LYCKPWQ/JeFp
         wLNQ==
X-Gm-Message-State: APuU4Z8K1kUIJZ7durhnGUK//HBllvPmmAMHJb7boIt6fFvHnmcLObMp
	Iyi9Fp4RyfCted172PJ2CZ8YbMCnlqXPWyttChtdClkkL6Vq38CEE91lEkj70WT7nig0AUaD0Gf
	WEhgxErNwnXDFwDUc3kkZYxYaDiIW1C0SS8HZVHlMSj8rIkjpD7uYSSNK8jCrByUcW/vj3g==
X-Gm-Gg: AYBFou1XARM+1ksKS68UAxMaVzalODLoGB2EgXMAqgt7NOu452gfjr4PsgLW56MC89W
	z/gxEUv8Xp33kqo1tikOpTbmgEeO+pEnd2agCXsWCkxoyX41G1Y4MjhXRRYfpfrMWl4axn+3Avg
	up2odWwWtOovujxwGfM7PKT+E9rxOIYtzhNVXjMVd6N7nRjaHKuV3aaFe3LD8GsUItBMO/QCNEv
	AVxoJH0+wiyZS0baSI/N2Rcfvbu9wdxKdLjmd59RrSHRGx9FbHTpSYfS5r9DnTpYnCMPyLzKFsj
	c64G8IqyIIDh4EEJg5UvlItd7yw4N2qv4xJu5w8d6cIrg3lt4q0ZyOZST+NHKQ7W7e7nsRWtFQO
	t7KH/tVnSATziVZ9qcEsxc8s4ximf3mACue3I+TSzR4vt0VZwUfHfQrtXd8oju/BJcMFFtSlDVE
	8TxpG8rOrIS6M=
X-Received: by 2002:a05:7300:cc96:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-37966a57f56mr2077926eec.27.1794565394929;
        Fri, 13 Nov 2026 02:23:14 -0800 (PST)
X-Received: by 2002:a05:7300:cc96:b0:36a:5126:a8aa with SMTP id 5a478bee46e88-37966a57f56mr2077897eec.27.1794565394049;
        Fri, 13 Nov 2026 02:23:14 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:13 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 10/19] wifi: nl80211/cfg80211: add support for NDP initiation in offload mode
Date: Fri, 13 Nov 2026 15:52:19 +0530
Message-Id: <20261113102228.1917973-11-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6e514 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Me5KlxI2VME_hw2-6gAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: RGbDvfTjO5Tybo3tayWw6cVITSQju76h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX3cjtLBk4Qo21
 1yp7gZDzdsCB7HCLMkJST5stSiFQQ4PTKLwI6kxCUG7YbdmVv4xF/a1/Z08tJOUHXJAqQIu13Er
 Wb/CsmOIJcy7X+Chtzu5tfwXYQtRPe1MNX9zjRk9L33iVo6DqdX7JNGJctB7vuVLYJGStnjQn1J
 GwgtdcEny/BMQBN3zXRzBqrZcJ/GnXDrojdK6D6aEVtKDqqUlewRd7WrbeKQnttta9ixt4iZcjq
 wKtNq559R25n8lBbQnK0iuRs57TOuj7MHktnXBErBGWTGO8R7jRtm3AiAjQzSHp5apkrxSiKmP6
 VS1VS2EGpiHw4gYnuJ7GkV1+J6CCWIbPVZfUYF7tHEwY1pXdUKQAEa2BD6qCg3s0X6W5UvMsqW9
 wyHBk8ZCDXTeAWCkhehJIGiplhzXuhionRlCZuUEFAeusFMzlfR/S3YeULrcM8VSEjaWH/O5dC2
 MKsUb33q3szaBFUbdag==
X-Proofpoint-ORIG-GUID: RGbDvfTjO5Tybo3tayWw6cVITSQju76h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+6ZMJbmZZ3WZ
 N8SWInLRwLtEWR5QKy/mhc65nkYo0JRYFxKpRvdh8w7ipOmyUtONRvdtY1rEfV3lsecJobfw/EU
 qv1keAyUaQ053S0Ifew8rG70Q05qyy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Add NL80211_CMD_NAN_NDP_INITIATE to let userspace initiate a NAN Data
Path session when NDP management is offloaded to the device. Validate
that the initiator NDI exists locally, pass key material by pointer, and
apply the NAN security requirements to cipher suite, PMK, PMKID, and
GTK.

Let the initiator provide QoS requirements for the NDL schedule through
the minimum time slots and maximum latency fields. The device uses these
values to allocate the NDL schedule within the user-configured local
schedule.

Let the driver assign the NDP ID and return it in the command reply.
Clear the request skb after handling it because it may contain PMK data.
Trace the non-secret request parameters without recording PMK or PMKID
bytes. Build the reply and reserve the NDP ID field before calling the
driver, so reply construction cannot fail after the driver accepts the
request.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  65 ++++++++++
 include/uapi/linux/nl80211.h | 105 +++++++++++++++
 net/wireless/nl80211.c       | 242 +++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      |  16 +++
 net/wireless/trace.h         |  93 ++++++++++++++
 5 files changed, 521 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index b1289d5fcd93..6b3b46a993a3 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4387,6 +4387,60 @@ struct cfg80211_nan_peer_sched {
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
+ * @qos_min_slots: minimum number of NAN time slots required for this NDP; 0
+ *	means no preference
+ * @qos_max_latency: maximum number of NAN slots between two non-contiguous
+ *	NDL CRBs; 0xffff means no preference
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
+	u8 qos_min_slots;
+	u16 qos_max_latency;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5374,6 +5428,14 @@ struct mgmt_frame_regs {
  *	offloaded NDPs, userspace configures these channels for the device to
  *	consider while negotiating NDL schedules.
  *
+ * @nan_ndp_initiate: Initiate a NAN Data Path session as the initiator.
+ *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP.
+ *	The driver must set params->ndp_id to the assigned NDP ID (1-255) on
+ *	success. Each accepted setup attempt completes asynchronously with one
+ *	status notification, including on failure or timeout. If the device cannot
+ *	meet the QoS requirements in @params, it reports setup failure with the
+ *	Wi-Fi Aware reason QoS_UNACCEPTABLE.
+ *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
  * @get_txq_stats: Get TXQ stats for interface or phy. If wdev is %NULL, this
@@ -5788,6 +5850,9 @@ struct cfg80211_ops {
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
index f22ad0a018a7..33af139c4d4b 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1575,6 +1575,25 @@
  *	addresses (%NL80211_ATTR_MLO_LINKS, each nested link with
  *	%NL80211_ATTR_MLO_LINK_ID, %NL80211_ATTR_BSSID and %NL80211_ATTR_MAC).
  *
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
+ *	%NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS and
+ *	%NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY may be supplied as NDL QoS
+ *	requirements. The device uses them to allocate the NDL schedule within the
+ *	user-configured local schedule. If the device cannot meet the QoS
+ *	requirements, setup fails and the status notification reports the Wi-Fi
+ *	Aware reason QoS_UNACCEPTABLE.
+ *	Each accepted setup attempt completes asynchronously with exactly one
+ *	%NL80211_CMD_NAN_NDP_STATUS notification, including on failure or timeout.
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1862,6 +1881,8 @@ enum nl80211_commands {
 	NL80211_CMD_EXECUTE_SMD_TRANSITION,
 	NL80211_CMD_COMPLETED_SMD_TRANSITION,
 
+	NL80211_CMD_NAN_NDP_INITIATE,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -3356,6 +3377,9 @@ enum nl80211_commands {
  * @NL80211_ATTR_ASSOC_PROTECTED_TWT: Enable protected TWT for the association,
  *	requires protected TWT support (flag attribute)
  *
+ * @NL80211_ATTR_NAN_NDP: nested attribute carrying NAN Data Path parameters.
+ *	See &enum nl80211_nan_ndp_attributes.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3963,6 +3987,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_ASSOC_PROTECTED_TWT,
 
+	NL80211_ATTR_NAN_NDP,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -8120,6 +8146,85 @@ enum nl80211_nan_conf_attributes {
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
+ * @NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS: optional u8 Minimum Time Slots field
+ *	of the NDL QoS attribute, specifying the minimum number of NAN time slots
+ *	required for this NDP. Absent or 0 means no preference.
+ * @NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY: optional u16 Maximum Latency field of
+ *	the NDL QoS attribute, specifying the maximum number of NAN slots between
+ *	two non-contiguous NDL CRBs. Absent or 0xffff means no preference.
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
+	NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS,
+	NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY,
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
index 7426d2c8a40b..53cd9d5cd648 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -819,6 +819,34 @@ nl80211_nan_peer_map_policy[NL80211_NAN_PEER_MAP_ATTR_MAX + 1] = {
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
+	[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS] = { .type = NLA_U8 },
+	[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY] = { .type = NLA_U16 },
+};
+
 static const struct nla_policy
 nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_CLUSTER_ID] =
@@ -1112,6 +1140,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_BANDS] = { .type = NLA_U32 },
 	[NL80211_ATTR_NAN_CONFIG] = NLA_POLICY_NESTED(nl80211_nan_conf_policy),
 	[NL80211_ATTR_NAN_FUNC] = { .type = NLA_NESTED },
+	[NL80211_ATTR_NAN_NDP] = NLA_POLICY_NESTED(nl80211_nan_ndp_policy),
 	[NL80211_ATTR_FILS_KEK] = { .type = NLA_BINARY,
 				    .len = FILS_MAX_KEK_LEN },
 	[NL80211_ATTR_FILS_NONCES] = NLA_POLICY_EXACT_LEN_WARN(2 * FILS_NONCE_LEN),
@@ -18504,6 +18533,212 @@ static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
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
+	struct nlattr *tb[NL80211_NAN_NDP_ATTR_MAX + 1];
+	struct nlattr *ndp_attr, *id_attr;
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
+	if (tb[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS])
+		params.qos_min_slots =
+			nla_get_u8(tb[NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS]);
+
+	params.qos_max_latency = U16_MAX;
+	if (tb[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY])
+		params.qos_max_latency =
+			nla_get_u16(tb[NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY]);
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
+	ndp_attr = nla_nest_start_noflag(msg, NL80211_ATTR_NAN_NDP);
+	if (!ndp_attr) {
+		nlmsg_free(msg);
+		return -ENOBUFS;
+	}
+
+	id_attr = nla_reserve(msg, NL80211_NAN_NDP_ATTR_ID, sizeof(u8));
+	if (!id_attr) {
+		nlmsg_free(msg);
+		return -ENOBUFS;
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
+	*(u8 *)nla_data(id_attr) = params.ndp_id;
+	nla_nest_end(msg, ndp_attr);
+	genlmsg_end(msg, hdr);
+	return genlmsg_reply(msg, info);
+}
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
@@ -21816,6 +22051,13 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.flags = GENL_UNS_ADMIN_PERM,
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_NETDEV_UP),
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
index 44a4255bbc03..e60478a25a31 100644
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
index b0ff3cc4176d..26e966c743c8 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2552,6 +2552,99 @@ TRACE_EVENT(rdev_nan_set_non_evac_channels,
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
+	"ipv6_intf_id: %s, qos_min_slots: %u, qos_max_latency: %u"
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
+		__field(u8, qos_min_slots)
+		__field(u16, qos_max_latency)
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
+		__entry->qos_min_slots = params->qos_min_slots;
+		__entry->qos_max_latency = params->qos_max_latency;
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
+		  __entry->qos_min_slots, __entry->qos_max_latency,
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

