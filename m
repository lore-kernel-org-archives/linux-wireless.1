Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285210;
	b=OW+GeUdkR0j0Tpow9LbK0+CW5kLV6JffWumFQA/knp7NdZvElWxNKWkDCsaU6Fx6iW+m
	 YYP4V4cNLGvzQq22H98Sx01YUZT9Rimqgz10TdfNhxav3Tpqc2yTMRRWlwri1z5iaArs7
	 dE0ZH+y8TQO4akrrKmh5QY8MI6IRpcK1XljMeYPBTtbBk9WEKT6EsNzA2bTeicR84CpfP
	 /MJ4dc1sj4Lm1UekgJ77EjP0okg8ps69AekAaBRozVPTots2lW6PB4/XP6q8HJR0gPY/z
	 klkvOrAPMu56oPTmUWMO5pNzoBfMbrx3LMjslC5oyQnyc7iRI2eqsWWruzwliNCqPHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8BLl0V6JnNbbZd0B/t1WFmFawXCdV0ynHZEFXceQjHQ=;
	b=Rwzfnk4EfkVHnCK7MEdv02E1cj3elI5NgyRm5n+q4Jmv1Q/30LKgvsS3gez1ls4Bh0Az
	 gy86b2ir3U0QR8QHx/aSAYODE2snpSroaiWHGxcfTseMjtjw3q1Kvh1e7d+a7K1utDUFM
	 ns02Zg/HkW0zYKE1y59w2RS23cqu6xBjvpY3ZlTfzwDS4OLQ1wn+hXzJjEPNbWDTp6lEK
	 ZL5QCUXiuSvfmKMwY1hTVZSoVlR/IvVuXCkJLGOMX1udwLKsLJUMbxKaA6wWbZpEA/lbC
	 6CPInJCyRzelMdTYswzdt4C7wJkIZ/YQlDVJggnZv9hupJi7oTQ/Mem5crLwvjpnUjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N3U/5Akr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AYP/XfnS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74160A382C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF74160A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3U/5Akr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYP/XfnS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A5641957598
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8BLl0V6JnNb
	bZd0B/t1WFmFawXCdV0ynHZEFXceQjHQ=; b=N3U/5AkrNKvwovlHzsYNEiOrcZ4
	vcrqQJiUkYDHg3D9SSCTX4SH0WDRlpkz3Lg3BcKhUzLHCkiZOc9cpOzF863kK6h4
	l9sF7Mlhq9+hejjjJGFYx/sFzibI3SQd7A+/GIxxAeb9vVHeE5M03ebwoI78pgZJ
	iTn2lJbHAOFpfohGjqczUMhJlQebBtIGVrL1Ym/2p9Y5Dn3lZ5dXG+Q1ixs5xrhL
	CsphCDgOsdgPB7pz5R6F3Tey3chPSs5K0o+GsfkroIirShzYcIatsLz3pdyILmJk
	UCy210Qlt6jeRp0FwrHPH9zMRBBltyes2bPwUjDbp3zUlR6c/bGKEv4soHw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkkaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so7524eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285208; x=1794890008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BLl0V6JnNbbZd0B/t1WFmFawXCdV0ynHZEFXceQjHQ=;
        b=AYP/XfnSMETFPIJcRmHjbhH9Rb+9foZYzNZuNX2tc7dskPkE4/BhkTGUZMfGikln4Y
         bHamo2moDaifz7Z+CHaGGxTTgJuk9Yn1yzrGrw8Hi3xO+MSUoQKf+A6uJLaFdq7BCtx9
         Kl0+Qdx1z2bj5Jwj+9fyVWUEcRih80+UCd+U1gFz7sK1T6FhuUWezjnBXaEH9ufaznYS
         BRWpBT47W5PWeU7VgHrcIvkECBMntAwbGKheZ89uGbbx5jaSc0CGzSKdN2y9T6tCAqKb
         PM2tcPXugeJtQiYBpKYw5R35kvt9yHZuIRHchVGhizc+fOHaKztyJ+lX/epnsibHV61I
         cLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285208; x=1794890008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8BLl0V6JnNbbZd0B/t1WFmFawXCdV0ynHZEFXceQjHQ=;
        b=g9h3yDBtdDDZeU9M0MAzzy7+lVJ6+ZxTPgVEpOuO38TVHR+o6ajL86dGsKwiazvN71
         +Roqc2/k+8IuoJ6hQ7PSeHRbgoa97bm6Xbzhif8l7LGSLmjmX2x63GrA+xoqCvjbDOar
         5Ugsk3dvAagUMxf0/XH+Ko/8XbK6R7tti04rE6N8OJBIS/RvL/CTxpI5T6tKiDYrE8hZ
         TzXP0ga3qAk5FHi9hHNVV9Wop1Vmiy7fcOdZ+MnJ6kyLnzijfEHwV1pgNbzMtm0zOPc3
         TnnRuQTVJRH0F4yuaf+8iCS3amglNUC/f+bdY4MVb+CcxHHl/kl2zMQd/2jU+0YZyDFw
         KNdg==
X-Gm-Message-State: APuU4Z+56N4z/xSXorjFQ/ELc2/fqO07WHaBlghfNALr2UjYHjJmvEpc
	MiMs9hh1hOgPW+kYLqO3wqRHz9YOajEPA8gkKCXRtgcSgip5RvcAcJ/4AvDLX2GtJqisA4vl6LM
	J82G5Pf4vK24OA7dYEWGpyq53lxFu8ppPfbFoDDre8tWIBlk7gZuhvDOUyC7V01IQUDpITVyBjw
	S66Q==
X-Gm-Gg: AYBFou06s0bVlWJqOtZbDh7r43JylVi63inCoHTC3Cy3+VeWVdersdEzS9YIo5NcvyX
	+sYo/r8B6LYVxbWAhJblQvMv5Nc7MWsR5zDpwRkcx3t65mtiimgBKyeQh0cLNGiX43Sb++VL9XM
	+W1lMSOO0Bgfb66WOD2XiuYir5K9XMT9KBxxdvMHIEJOw6S36l6IJeQ3G4KMaHgwnJVfapF3EJP
	YZ5YmnCH4y4kblapU7yMmpklSYbvilbiojld8nRRQ19Ow5/WgHAzCDpHrBpEM42QvbfjtdSDE6n
	hxa5WhSyQGjSemyzFQHp5ag9Z/eYG+EvOrdyw45jfWmqJnvkq0XtWS1j3t9uypBX2EJLCakRRNu
	MiweaQp3Py88KCu+eKWYsojqvWlMtxEAdRD0gFZhhGXWBp6aidglXD8Z9o+hWMFJiyRA1NXhL9c
	irDG1TybuEHQ==
X-Received: by 2002:a05:7300:8815:b0:357:ee3a:267a with SMTP id 5a478bee46e88-3751ca2856emr2134412eec.2.1794285207398;
        Mon, 09 Nov 2026 20:33:27 -0800 (PST)
X-Received: by 2002:a05:7300:8815:b0:357:ee3a:267a with SMTP id 5a478bee46e88-3751ca2856emr2134361eec.2.1794285206511;
        Mon, 09 Nov 2026 20:33:26 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:26 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 12/19] wifi: nl80211/cfg80211: add support for NDP termination in offload mode
Date: Tue, 10 Nov 2026 10:02:35 +0530
Message-Id: <20261110043242.2012238-13-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX6AAnZybpAZa5
 M2Dc0asHczE+/SSicoDWTG6OXMi/V+KYvOn8y8sHYQMM4JvhhPGvjzEsuTtXsiCgXSzJdSCaaZI
 W/Is72RXGj6Egv/7sXtFswHcYJ0e3zc=
X-Proofpoint-GUID: nLS8ORh_e4CZin_gB2U_g4xLZ7senDGv
X-Proofpoint-ORIG-GUID: nLS8ORh_e4CZin_gB2U_g4xLZ7senDGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX5FBovF3CfW5n
 9j3Kfum3TYpCDClmqAm0/Tz7YE0xq6zkRA4AW28T6FEVCXuJH4KaggJvd8Kfj1KxiN3Mefxnfjm
 1wjupy9h0QXZ3GhtXTp0mCeD5mmw3KHdZ4ue2Y4Aw9bKntzrAA+OTw8v3O4dipivFLnhZF8lvdl
 j1AphrPoLPzx3G9EY3hUdvvPeNE1DDz/qAgpQfbvHg4MN2F+OVxIw2w7JRLWiOvzJCPqtZmjatJ
 0CRBlbxu1ssVzPvt6/vaz4fdwCUyGQGvFje8TSu7LQxJ0XUFNzu0pWKKhnlWmh9uZNlj1cF6TIo
 kcw6pAyQ37Q6Py8BJ30v6JOTVl2bUoJJ7wI86AAzkrsG8rqQnJTZn2HxRUXU5BA5WEUl2hDj+WS
 JETa/ZUmZS+yeVNscU/7Xc2WBbGj+z0OAKYz3HtMGpWx1qHjPHSyCsxJXjR06IacCTj5XMiKdV+
 hUIV5ELdPSe5m1WWwgg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af29e98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0KldnaiawyD8QZSghiAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

Add NL80211_CMD_NAN_NDP_TERMINATE to let userspace tear down an
established NDP session when the device offloads NDP management. Pass
the initiator NDI from the request through to the driver; it may
identify either the local or peer NDI and is not validated as a local
interface.

Add the termination parameter structure, command handler, and driver
callback, and trace the initiator NDI with the other request metadata.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 22 ++++++++++++++
 include/uapi/linux/nl80211.h |  7 +++++
 net/wireless/nl80211.c       | 58 ++++++++++++++++++++++++++++++++++++
 net/wireless/rdev-ops.h      | 16 ++++++++++
 net/wireless/trace.h         | 27 +++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 151555fa8404..e07e167caaf7 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4443,6 +4443,21 @@ struct cfg80211_nan_ndp_respond {
 	u8 transport_protocol;
 };
 
+/**
+ * struct cfg80211_nan_ndp_terminate - NAN NDP terminate parameters
+ *
+ * @peer_nmi: peer NMI address
+ * @ndp_id: NDP ID to terminate
+ * @init_ndi: initiator NDI MAC address
+ * @reason: Wi-Fi Aware reason code for termination
+ */
+struct cfg80211_nan_ndp_terminate {
+	const u8 *peer_nmi;
+	u8 ndp_id;
+	const u8 *init_ndi;
+	u8 reason;
+};
+
 /**
  * enum cfg80211_nan_conf_changes - indicates changed fields in NAN
  * configuration
@@ -5436,6 +5451,10 @@ struct mgmt_frame_regs {
  *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP. Returning
  *	success acknowledges the response command only; setup outcome is reported
  *	asynchronously after the handshake.
+ * @nan_ndp_terminate: Terminate an established NDP session.
+ *	Only valid if the driver has set %WIPHY_NAN_FLAGS_OFFLOAD_NDP. Returning
+ *	success acknowledges the request; report completion asynchronously with
+ *	cfg80211_nan_ndp_terminated().
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -5850,6 +5869,9 @@ struct cfg80211_ops {
 	int	(*nan_ndp_respond)(struct wiphy *wiphy,
 				   struct wireless_dev *wdev,
 				   struct cfg80211_nan_ndp_respond *params);
+	int	(*nan_ndp_terminate)(struct wiphy *wiphy,
+				     struct wireless_dev *wdev,
+				     struct cfg80211_nan_ndp_terminate *params);
 	int	(*set_multicast_to_unicast)(struct wiphy *wiphy,
 					    struct net_device *dev,
 					    const bool enabled);
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index bdd52fcafe85..0303b9f22a5d 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1512,6 +1512,12 @@
  *	processing; setup outcome is reported asynchronously by
  *	%NL80211_CMD_NAN_NDP_STATUS.
  *	Transport port and protocol may be supplied together only when accepting.
+ * @NL80211_CMD_NAN_NDP_TERMINATE: Terminate an established NDP.
+ *	Requires %NL80211_NAN_CAPA_OFFLOAD_NDP. Carries %NL80211_ATTR_NAN_NDP
+ *	nested with %NL80211_NAN_NDP_ATTR_ID, %NL80211_NAN_NDP_ATTR_INIT_NDI
+ *	and optionally %NL80211_NAN_NDP_ATTR_REASON.
+ *	The command reply acknowledges the request; teardown completion is
+ *	reported asynchronously by the termination notification.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1797,6 +1803,7 @@ enum nl80211_commands {
 
 	NL80211_CMD_NAN_NDP_INITIATE,
 	NL80211_CMD_NAN_NDP_RESPOND,
+	NL80211_CMD_NAN_NDP_TERMINATE,
 
 	/* add new commands above here */
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 85b8181b7c68..abd17ee04c94 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18919,6 +18919,58 @@ static int nl80211_nan_ndp_respond(struct sk_buff *skb,
 	return rdev_nan_ndp_respond(rdev, wdev, &params);
 }
 
+static int nl80211_nan_ndp_terminate(struct sk_buff *skb,
+				     struct genl_info *info)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	struct wireless_dev *wdev = info->user_ptr[1];
+	struct nlattr *tb[NL80211_NAN_NDP_ATTR_MAX + 1];
+	struct cfg80211_nan_ndp_terminate params = {};
+	int err;
+
+	if (wdev->iftype != NL80211_IFTYPE_NAN) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP terminate requires NAN interface");
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
+			       "NDP terminate requires peer NMI and NDP params");
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
+	if (!tb[NL80211_NAN_NDP_ATTR_ID] ||
+	    !tb[NL80211_NAN_NDP_ATTR_INIT_NDI]) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NDP terminate requires NDP ID and INIT_NDI");
+		return -EINVAL;
+	}
+
+	params.peer_nmi = nla_data(info->attrs[NL80211_ATTR_MAC]);
+	params.ndp_id = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_ID]);
+	params.init_ndi = nla_data(tb[NL80211_NAN_NDP_ATTR_INIT_NDI]);
+
+	if (tb[NL80211_NAN_NDP_ATTR_REASON])
+		params.reason = nla_get_u8(tb[NL80211_NAN_NDP_ATTR_REASON]);
+
+	return rdev_nan_ndp_terminate(rdev, wdev, &params);
+}
+
 static bool nl80211_nan_is_sched_empty(struct cfg80211_nan_local_sched *sched)
 {
 	if (!sched->n_channels)
@@ -22094,6 +22146,12 @@ static const struct genl_small_ops nl80211_small_ops[] = {
 		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP |
 					 NL80211_FLAG_CLEAR_SKB),
 	},
+	{
+		.cmd = NL80211_CMD_NAN_NDP_TERMINATE,
+		.doit = nl80211_nan_ndp_terminate,
+		.flags = GENL_ADMIN_PERM,
+		.internal_flags = IFLAGS(NL80211_FLAG_NEED_WDEV_UP),
+	},
 };
 
 static struct genl_family nl80211_fam __ro_after_init = {
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index d65dd39a1bcb..8bcc999be166 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -1221,6 +1221,22 @@ rdev_nan_ndp_respond(struct cfg80211_registered_device *rdev,
 	return ret;
 }
 
+static inline int
+rdev_nan_ndp_terminate(struct cfg80211_registered_device *rdev,
+		       struct wireless_dev *wdev,
+		       struct cfg80211_nan_ndp_terminate *params)
+{
+	int ret;
+
+	if (!rdev->ops->nan_ndp_terminate)
+		return -EOPNOTSUPP;
+
+	trace_rdev_nan_ndp_terminate(&rdev->wiphy, wdev, params);
+	ret = rdev->ops->nan_ndp_terminate(&rdev->wiphy, wdev, params);
+	trace_rdev_return_int(&rdev->wiphy, ret);
+	return ret;
+}
+
 static inline int rdev_set_mac_acl(struct cfg80211_registered_device *rdev,
 				   struct net_device *dev,
 				   struct cfg80211_acl_data *params)
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 7888a2c8d256..c7a3c0e4b565 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -2732,6 +2732,33 @@ TRACE_EVENT(rdev_nan_ndp_respond,
 #undef NDP_RESP_FMT_3
 #undef NDP_RESP_FMT_4
 
+TRACE_EVENT(rdev_nan_ndp_terminate,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+		 struct cfg80211_nan_ndp_terminate *params),
+	TP_ARGS(wiphy, wdev, params),
+	TP_STRUCT__entry(
+		WIPHY_ENTRY
+		WDEV_ENTRY
+		__array(u8, peer_nmi, ETH_ALEN)
+		__field(u8, ndp_id)
+		__array(u8, init_ndi, ETH_ALEN)
+		__field(u8, reason)
+	),
+	TP_fast_assign(
+		WIPHY_ASSIGN;
+		WDEV_ASSIGN;
+		memcpy(__entry->peer_nmi, params->peer_nmi, ETH_ALEN);
+		__entry->ndp_id = params->ndp_id;
+		memcpy(__entry->init_ndi, params->init_ndi, ETH_ALEN);
+		__entry->reason = params->reason;
+	),
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT
+		  ", peer_nmi: %pM, ndp_id: %u, init_ndi: %pM, reason: %u",
+		  WIPHY_PR_ARG, WDEV_PR_ARG,
+		  __entry->peer_nmi, __entry->ndp_id, __entry->init_ndi,
+		  __entry->reason)
+);
+
 TRACE_EVENT(rdev_set_mac_acl,
 	TP_PROTO(struct wiphy *wiphy, struct net_device *netdev,
 		 struct cfg80211_acl_data *params),
-- 
2.34.1

