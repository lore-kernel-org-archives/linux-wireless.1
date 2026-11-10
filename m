Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285216;
	b=Z0J6lB6rG5kb6VHXfKq+HCiFkfW2oiIrqNX/sPZtC+U4vxF82V0mPHGHg0UWl2/TxFvQ
	 jATpuZqM2NRTGHtqQ6tAdGuWmb3vMdyXcDkiCsy784sRBrqa/fFGzzWWb9H070XBhvfq3
	 vvPuslB0plPFH08Z40g+lUDZRUSNE6o5qPTk4nwSfmWMzI9oNQL2RViFr5gzhazPADMef
	 gh22bypK4WuQ1O6f77K/ReDrnoEKNqwizteK4f6JHMMNy5VGoW0rbEJeg4P8c0tCSkPjm
	 lTNvjZvb+RCK5Es/ZpOQfomFRIxJPi+laCU1Wq08qwFcauqXQt5kupVAxLg9dOYrWrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Nr8V87N5XCc1GQiwaXvoCypc7ydauOT2x/83GnBGyM=;
	b=GpEolGw3pUZMHgn96jdVL1ri9pXDEbWJv+LgauzCHEz68bYegUw1NXARJnekfWhTcAF+
	 8bAA80WdNe0rwMInbU9Tem7JUXjyM1uTlKgotF8l9Bp0yKF5CQq5ySc/w+fy/TZ/4QMw/
	 xR9v9QttE02rvfYFCQk6NKowCdeVt2uhzkMDYty/l72dx7eS5fD34enTr85wv8f3wg76a
	 ABlKCKnv6c7qm+E2l0PFjllRrCaJ0BwXGIsZHQLKUciI31PXFqoGnvB2NQd7R95O8h9vV
	 vhHEHUIG8u3eT8zwpYoxBtTekMUFSwoH34wPKPbHGNKGZiV2dOW2wTwbrpXqkIFESXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NS6igczh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fW/wfXkz";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B560A5BC2
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1B560A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NS6igczh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fW/wfXkz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A3dB2249912
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Nr8V87N5XC
	c1GQiwaXvoCypc7ydauOT2x/83GnBGyM=; b=NS6igczhhVcAeEKe+K/zLJRLB5f
	CTlYZEx9df5C4v+C+JRwBrk+XCykW3ClphLcafGUOjc7o83jpXYvnFJOa/ZOKCG5
	O+YwS89ZawjULFMLJPtJlurjuB80fr2lKGfFiquAn0oxQBn5kNnTkz5c8GsPMFOi
	6JMOhtaUmxpaVMIcdbX15Q/NSXHz4foT+6NwkvfgtrGZIX8DydklrqrNNepDSY10
	BL3Wk8oLo1+7CzlYlAu+oZslyandtIORrOFAcCVW7WTB+IzmTF4Hlm+ocOiS15GG
	dgko6aKQuU0/O5bNXBxdpsln95uSumVH2l9LefBpczcfvSrm7cc9EJmDcTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbmrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2281309eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285215; x=1794890015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Nr8V87N5XCc1GQiwaXvoCypc7ydauOT2x/83GnBGyM=;
        b=fW/wfXkz+XYCgA0l4fDLzOzsRBhT5desHWZm7v4i7Rz/xG8udpyCTeKzrzdqBUhYo+
         7EpPDyZ8sH0oHhgOCcGDaZDycSHL81CFqPNkUT37DNka5z0tUp8N+yo0YvBXRDEd+rez
         EVuh0/PupNnCrY5BmX8yKgAmWwoblbV7EM61olWbu5E756G1pExrXY1DK0Kozj28uTNA
         nZYcY/oGoy0ye5valU1aQByV62da0t5/GlXK/gNy8nKj0dWyYhEE0F6a/lHEOgIE+MPE
         fHtowi40JlsDR/ksRYj/U1YA3kHGW34G8/N6hxKhPYYfQmPCnNy6A8zXQw1Rm+Vo/eLc
         SDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285215; x=1794890015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Nr8V87N5XCc1GQiwaXvoCypc7ydauOT2x/83GnBGyM=;
        b=ZddBgHR3zDbQ31rBL2FU2anLBb4XpmL1yZ1zNznFuguu5lGPeZYxZV1bUa55A/rExZ
         QY2sbI4v+g1s+L7trjtxTSyXaPb7mshOjtmh2mlAP/ylsLp32oxFNIuf1oF3JxkUgvZi
         5fccZPQyiknsZ4XbK3ZoXd+q6FAxYMX6QYJ/EME5XnM90lH4flUpJA5wsgIetAvaaiBw
         xblz0ZMPKogGBY4HiY0jXDeGWxRxnpKJdEwug8ELwzcC3Kt3/4L0utGdcOsu9nqF0OxQ
         riAxjmBipOPErBXgQCZJKxbmuoQKW3JVWM80CYALWqDUjebfY1rv6vKKSXrtLfygssTV
         sS2w==
X-Gm-Message-State: APuU4Z/P4nuZ0t34qegrhePCuT+3PWo+i5ZnqAN1MvDzpZgJIkz+EiG1
	d+9PbatXUecmgbhlI+zAFdqnN57Pk2Cv6JesEDbOb0UNhQ13vvydja15NEO7doV/Fgn9UrkB5Le
	3Elj52HY0JiKvKuPK5YRPnAnZetfNa/yv7xvkEp3wT7mJaIU2OXKn5yUV0e2kDkWqALmD2+aVMM
	YbfQ==
X-Gm-Gg: AYBFou2ViBqITG2+1FXtswS+jzR0AVjaIZ7UOVvz8es4gwabeJH1jOxfS/4ubnDXSMV
	A5IDFR5wUXnHecTazI2FZL1CW8ht3X/UKTtbp6A4cdqCOroV+6U13pzDcZ0XyTpRE8j0+m1h1mY
	Q3fx4mYNEmyH3SG7Cld8xR+gmm9RqPvEHxTT+pKZ9AvfSWvAKUKSAREIV7ePVJNA5aoiCV/PCX2
	+1BRb0GW3xkpLAQWym/ijBB39qxB9v5Nmh5jYv0NYPc8GJexPsfOk7oINwG2zldlODiilry+0TK
	iiCFuKxwyajcU+w+7m4ykeomca7byzbyYjBOOaeUFK03By53NGTAWOnsD/j1wpEkZGfD4uynltr
	vpheHXdl4N8gQIfdHDQXtcoqIMKL/y5P5DQE+R3VxIdL55o7YS+hX4HSd/MPG//RM1w7Cltm6qY
	WeYhKVEyjF7Q==
X-Received: by 2002:a05:7300:ec8e:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3751ef77817mr1855644eec.19.1794285214094;
        Mon, 09 Nov 2026 20:33:34 -0800 (PST)
X-Received: by 2002:a05:7300:ec8e:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3751ef77817mr1855605eec.19.1794285213501;
        Mon, 09 Nov 2026 20:33:33 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:33 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 15/19] wifi: nl80211/cfg80211: add support for NDP terminated indication
Date: Tue, 10 Nov 2026 10:02:38 +0530
Message-Id: <20261110043242.2012238-16-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfXxDNV/9Smsmjk
 FANqU+ZRdEmRRCm9H5Znb/xvxepe5M3nZwDspSwFVPnkxTFAUwfeGB/GoaL8AAdc5cUi5QWx2qt
 nh+k1BtLa7Xx1DkL4vXEs5A1k/nH3Bkt9bqYNUo/6luFGQtuE4QNEBAoGpWp+6vT/SSQVGOWEEd
 +3B7wecaY8PKtNu0fVZHiM6hzuXhUkgzMVp1oJ8dkluAYJPHHNpCY3p8A11jQ0mtvYuVyQZAYmM
 5ka/sciL3SwxXv7I7DIFEJ3czNwH3x6SsGXYX9Shy5v0Bu5dP/IxfczovGk3ig/OTONEfKWnEPV
 atyfkl5Mb1f0Hghog/7qV/jhlzQlltpudPEMsDg9494K2ImRxJQ+sPzSCvKQADg2mupm/7SDGVW
 Mg6Scqilcwp4r6dbTeOF4kUsSiNR4e55Bi68lrOw5m+/epGRNWrmWHqAlKLf0mrwPv6Anuv286E
 Py6Svo4DStGvfppwIOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX0EvvQY0X1HpB
 Xj63RKcmlQbEzvwtZRay7/p8QNO50yTVcXs6xVpn28pK2xNXDBrIY2FambB4je5lOACPUw7WTAI
 W6UqqnzCEYWySFSte6ppY7pPGXhtAlM=
X-Proofpoint-ORIG-GUID: R-EKD_wWrRlQ8GtoD27kv-Ce90EnvcKA
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af29e9f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=og0APZ68tbi0YRiGhQIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: R-EKD_wWrRlQ8GtoD27kv-Ce90EnvcKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

Use NL80211_CMD_NAN_NDP_TERMINATE to notify userspace when an NDP is
terminated. Include the NDP identity and reason, and add the
LOCALLY_GENERATED output flag to distinguish locally initiated
termination from peer-initiated termination.

Add the termination parameter and cfg80211 notification function,
validate and trace the event, and deliver it to the NAN owner or
multicast group.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 35 +++++++++++++++++++++++
 include/uapi/linux/nl80211.h | 15 +++++++++-
 net/wireless/nl80211.c       | 54 ++++++++++++++++++++++++++++++++++++
 net/wireless/trace.h         | 29 +++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index c0846bff31be..634dffbc2ed1 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4535,6 +4535,25 @@ struct cfg80211_nan_ndp_status_params {
 	u8 transport_protocol;
 };
 
+/**
+ * struct cfg80211_nan_ndp_terminated_params - NAN NDP terminated event
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID
+ * @init_ndi: initiator NDI MAC address
+ * @reason: Wi-Fi Aware reason code for termination
+ * @locally_generated: if true, teardown was initiated or detected locally
+ *	(userspace or device) rather than by a peer termination request. Includes
+ *	NDI down/removal, NAN stop, and peer loss.
+ */
+struct cfg80211_nan_ndp_terminated_params {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 reason;
+	bool locally_generated;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -11463,6 +11482,22 @@ void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
 			     const struct cfg80211_nan_ndp_status_params *params,
 			     gfp_t gfp);
 
+/**
+ * cfg80211_nan_ndp_terminated - notify userspace that an NDP was terminated
+ * @wdev: the wireless device reporting the event
+ * @params: NDP termination parameters
+ * @gfp: allocation flags
+ *
+ * Notify userspace that a NAN Data Path was torn down. Call exactly once for
+ * each established NDP, including teardown due to NDI down/removal, NAN stop,
+ * or peer loss. Only valid when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set.
+ * The locally_generated field is true when teardown was initiated or detected
+ * locally (userspace or device), and false when the peer initiated it.
+ */
+void cfg80211_nan_ndp_terminated(struct wireless_dev *wdev,
+				 const struct cfg80211_nan_ndp_terminated_params *params,
+				 gfp_t gfp);
+
 /**
  * cfg80211_incumbent_signal_notify - Notify userspace of incumbent signal detection
  * @wiphy: the wiphy to use
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c7b61fa16943..1901d0dc86d0 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1524,6 +1524,13 @@
  *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
  *	The command reply acknowledges the request; teardown completion is
  *	reported asynchronously by the termination notification.
+ *	This command is also used as a notification when an NDP is terminated.
+ *	The notification carries %NL80211_ATTR_MAC and %NL80211_ATTR_NAN_NDP with
+ *	%NL80211_NAN_NDP_ATTR_ID, %NL80211_NAN_NDP_ATTR_INIT_NDI,
+ *	%NL80211_NAN_NDP_ATTR_REASON, and, when applicable,
+ *	%NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED. Exactly one notification is sent
+ *	for each established NDP that terminates, including teardown due to NDI
+ *	down/removal, NAN stop, or peer loss.
  * @NL80211_CMD_NAN_NDP_STATUS: Notification-only event sent to userspace on
  *	the initiator and responder sides when NDP setup finishes, successfully or
  *	not. If %NL80211_NAN_NDP_ATTR_ACCEPT is present, setup succeeded and
@@ -8155,7 +8162,12 @@ enum nl80211_nan_conf_attributes {
  *	reason code (%NL80211_ATTR_REASON_CODE). Used for rejection with
  *	%NL80211_CMD_NAN_NDP_RESPOND, setup failure with
  *	%NL80211_CMD_NAN_NDP_STATUS, or termination with
- *	%NL80211_CMD_NAN_NDP_TERMINATE.
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, including its termination notification.
+ * @NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED: output-only flag, present in the
+ *	termination notification when teardown was initiated or detected locally
+ *	(by userspace or the device), rather than by a peer termination request.
+ *	This includes teardown on NDI down/removal, NAN stop, and peer loss; the
+ *	flag is absent when the peer initiated termination.
  * @__NL80211_NAN_NDP_ATTR_LAST: Internal.
  * @NL80211_NAN_NDP_ATTR_MAX: Highest NDP attribute.
  */
@@ -8180,6 +8192,7 @@ enum nl80211_nan_ndp_attributes {
 	NL80211_NAN_NDP_ATTR_CHANNEL_FORCED,
 	NL80211_NAN_NDP_ATTR_ACCEPT,
 	NL80211_NAN_NDP_ATTR_REASON,
+	NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED,
 
 	/* keep last */
 	__NL80211_NAN_NDP_ATTR_LAST,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 45d5c630e2a9..b781e71979d0 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19151,6 +19151,60 @@ void cfg80211_nan_ndp_status(struct wireless_dev *wdev,
 }
 EXPORT_SYMBOL(cfg80211_nan_ndp_status);
 
+void cfg80211_nan_ndp_terminated(struct wireless_dev *wdev,
+				 const struct cfg80211_nan_ndp_terminated_params *params,
+				 gfp_t gfp)
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
+	trace_cfg80211_nan_ndp_terminated(wiphy, wdev, params);
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, gfp);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0, NL80211_CMD_NAN_NDP_TERMINATE);
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
+		    params->init_ndi) ||
+	    nla_put_u8(msg, NL80211_NAN_NDP_ATTR_REASON, params->reason) ||
+	    (params->locally_generated &&
+	     nla_put_flag(msg, NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED)))
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
+EXPORT_SYMBOL(cfg80211_nan_ndp_terminated);
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 518fdc91f534..9ea561402b6c 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -4763,6 +4763,35 @@ TRACE_EVENT(cfg80211_nan_ndp_status,
 #undef CFG_NDP_STATUS_FMT_2
 #undef CFG_NDP_STATUS_FMT_3
 
+TRACE_EVENT(cfg80211_nan_ndp_terminated,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 const struct cfg80211_nan_ndp_terminated_params *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, reason)
+		__field(bool, locally_generated)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		__entry->reason = params->reason;
+		__entry->locally_generated = params->locally_generated;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, reason: %u, locally_generated: %d",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->peer_nmi,
+		  __entry->ndp_id, __entry->init_ndi, __entry->reason,
+		  __entry->locally_generated)
+);
+
 TRACE_EVENT(cfg80211_incumbent_signal_notify,
 	TP_PROTO(struct wiphy *wiphy,
 		 const struct cfg80211_chan_def *chandef,
-- 
2.34.1

