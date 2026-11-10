Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285203;
	b=GXMZoMWSlL8ZxskPed3CjzBbwmXbORzJ47oJIuWd8hn+mMVJ3IpkHxkiQ/txiPUiTmFs
	 /oIAIsyt8Q1PdbPMHsQPL9WiO9eHPsv5bRMyP2VH7b+CG0gZc1Sjxxbg8FlyDgc14Kdr7
	 FqS0xVUqjw7ezskYkt+4QWIfUHGBoPomHS0DWz26/mpNsTGHQPrWSXIU+sR0Z+pcFh8F+
	 739XGcAVI2nV6uHJCtIgQ45jysHK0PbqAZrgbwOD+26zQs8m9LSmraFSTQD7wpdtbuG+M
	 +8gKq46FwkeEidxc36AKt4ew6t1ZsoZ2Et301U1S/l836VywFgGEHb9+6OaLpl0GnjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AFM6Sg94WhIUTkTyuZwy4DTbQTSiScHlW27ON6fCUeY=;
	b=Br+8KDaTgdx27Mt3kk3JCuzUZZncRDMpt9/MplFEzpGZKpP4T3RnWiHsdHdYXZGH49jR
	 KHpYM/WaRISwT6KHvQiEayOvgudOPjuAxxHC5MAy5sCYaZtdwFFLc9mBgcU4BrC44j4oc
	 DR7iIpLsI+25qf69wB0utBb+BpomGuicSeofhXsIQtQvO0CPlaCIn/ZbUx2dD42r07VZ8
	 jk2i7E9rC7mMT/p5rlDOBAgLh0bc7Di9G09dGMGv+MsDyNRRO/sith9eAbJs2tVYDG8nr
	 uSBaOwnX0SRWBIEBzmbSPj+BAqwUqyIlMK7bmQ1aQxtw7UyG1aFQJUdwtFlngvIQPxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tr3iMwTn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJcBnPTn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710B60A263D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3710B60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tr3iMwTn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UJcBnPTn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A7HI2297915
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AFM6Sg94WhI
	UTkTyuZwy4DTbQTSiScHlW27ON6fCUeY=; b=Tr3iMwTnz0DCEq07Qr4Z29C+Jv4
	moyVXO8DILhLYoibgXmihKPvQZ8zlasF1OEQxtFIU3SWvhlUlk0d8KVIIh3Jarib
	BA3evrnd1VJ7w6T5vIEo/ikqlDgHnkNkI8f3qIytPxOCrcWg1oTpmg2ZznzYLxHN
	sUg814AYvN6Wib8+lrvyEpu6bYTgtJ4FHSD+yhkEqRLTri/2ItHVesP0/SGPKcCo
	tazpZWVBqpxg5uTMR1Fc+ZMRzhQvZJJFwUCYokKTEnJ/O9Tagf2EVJTSxRgy7cIn
	qNCjT6EzUMCSQZ+irWxe8L/9HTlccFCg8zLKRM8tfZoztvx3AXzHn+g/mbw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mxm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2960561eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285201; x=1794890001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFM6Sg94WhIUTkTyuZwy4DTbQTSiScHlW27ON6fCUeY=;
        b=UJcBnPTn1c9zJEcb18LaKJpQ7y65BfrcTmgyndgdhAglWu+lRVdpngtNeijjCyO7u8
         RrDEQqElEoFgMGUYIJHxYAqtx+BWklbvTa77F9QGwD7wfQUtfYZ+sz33FzIumQUGOwPQ
         vOO2U2c6iLmjmytpLjgfxGcl1WkRaSYvo87xFkD4oZt7kokbjy7uzvEeHRE8URE0UuXE
         IR+SfxNerkex5NihAkzCzMChg5fkLX5g58B9BnQ89jTXBay1rr34pS/ep7HjWGsOZt4+
         BMOwxbJd3qdbQTETARPsKeGW4d4s4FH2nP98FdL77j/lIDZ7+AHBgVG+y61CVx4AyQtI
         vIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285201; x=1794890001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFM6Sg94WhIUTkTyuZwy4DTbQTSiScHlW27ON6fCUeY=;
        b=2KrazyOfgDi54miRfziiwcLG7ZCPQM3OGkYmVtyj7E85YCwUcExhOlasqt58h/oRFy
         MLhPOhoVatzxW784+qTU94frZA76Ay586ml/Fpi6/99EkEIL6X4TQJ001Hab6y7zseB7
         FnjOWjnO74TH9t8I6GnwsicTR3IlK1QcSDxWeS4kG8ckefmXxmuhurZnFqVfTHYXQKRP
         js3uyk7pc/iTm0W2q/1ccAl4cB7ZgeRSpRYKxqRibJxpS1Kjp8Ysmj8HsK3NueenzgNE
         dFmG/HBOXcThba8hB/ewgBJFw0N7tIVbzrY42LPE7ooA5908irof9LPzjcF7EMgjJLkZ
         LxiA==
X-Gm-Message-State: APuU4Z+TQRoki/NiFuYVGZmesD9xvYbbGTNhccikfVKT52qG/2fggejy
	wCcZzKKkTMHJKJ6+BHCHHi3L5+5/g4ABmQhUft7kdFlQ1ZqR3NOlNK5OjLT/RTKMjs2+fD+1GGK
	qqhbh22suG+ADO9VBCjCFurwmKEPAN9ubtis6my01OO52Xpy12Gb4Gh30IyKN1YYJTCYaaKUr4g
	uHrA==
X-Gm-Gg: AYBFou0qnV4nx4Y0lExs632t/t3FMJLH0eCI4OIgcO54qvm3XB87t1/ZOA78cyFP6U1
	ZjeFj1oBs+nraFhJeRwPvwo2U/+o5asRfbuIJMILnQBaqknfI9Xm3K0j2MN4tjXHQbe/9ldMUst
	0+oITTPnNgKSBV732tcDUl4bpB8veAy8+OeRrs/NSfsb3iipfAdiHNfiqPBr2fOc9atOywt7in8
	4EoM/sqfn4PcR+7csKmMm8iSm8AgUU5sVcHxeRvPiV6HqpHLFekalie40CRvg8XPB6NWderpU7T
	uUFNaaOo7KKExVFaXbGBFe/ztE2x2mgt3+wchupFCcVnHbKo7PkKlZ7lcaaq8JPm1lIAYYW1apx
	sv788yuFnGWcbuLG0IFLF3AiSaW7BLcVTgSqHm+mJZiDnfkMQkr/QlzybVVYbd5W2TPEcjVH/6v
	tG4gq0Zln5qw==
X-Received: by 2002:a05:7301:783:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-3751e7a449dmr1497141eec.13.1794285200571;
        Mon, 09 Nov 2026 20:33:20 -0800 (PST)
X-Received: by 2002:a05:7301:783:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-3751e7a449dmr1497103eec.13.1794285199567;
        Mon, 09 Nov 2026 20:33:19 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:19 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 09/19] wifi: nl80211: add NDP offload capability advertisement
Date: Tue, 10 Nov 2026 10:02:32 +0530
Message-Id: <20261110043242.2012238-10-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af29e92 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JHu4ud0u86xE8xtC7wgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX0M++DhDkLhUH
 XoAK2HeBgu65M9DXg+TWZmRJLE1L81jWmqbZe1q/MtCe9RnWIamReG+I6TVDxks+8CRFVgz5eJl
 sclQdXbJinrov5pGZgeThSd9cKaTDV1E4pCjYIZO/mWOAWuEcZYC0tP0OcvWJcmrTCc28x1zrA8
 7l6Di7UvOp/SQDa5aLMMcScM/yyjDj7YyOl/g2MzvMVr9AmQ/1bzIsQW3bd6XBwz7Az2jcQFD5F
 tIN3hl0pfn/gcp1y5q9YxmEc22E0/jsjejIMO6eljcRBvlxZEMnDbeENXbIJD0+eVBxS3Ch4gqk
 0qyXsVkz0hC3LIDGiDjkq5UlMAXmdXjVht12MnrbBv5tOmQmdTF1iSIJxx/bsg9VlPCZOjj2aB/
 CM9ZhVwJ4u5utWFlKHL4A4rpudrq3itaM+p8B1SShe8pIAW0vjISYNJGslT7xPYKljdfAeCqz1E
 yfXtB6CiWflsrS7pJLw==
X-Proofpoint-GUID: AiuQILgY150MepyP__Tjck3k-t4sSRJx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX7kyZE+QaDW4M
 7OLM/HaPUoq5Fn6P49xD0o7L8kt1CzABNHrRPOq37cf8hM1uMU8/Lnm2XUkGxxXR3e5k3Y1FZzM
 KT8ve7F03WlUYwa7ZVZRDsKuENy9t/c=
X-Proofpoint-ORIG-GUID: AiuQILgY150MepyP__Tjck3k-t4sSRJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100017

Advertise whether a device performs the complete NAN Data Path setup and
teardown handshake, including security negotiation. An offload device
assigns NDP IDs for locally initiated sessions and derives and installs
the data path keys, including GTK when requested.

Expose the capability through the NAN capabilities response so userspace
can determine whether the device supports the NAN NDP commands and
notifications. Secure NDPs additionally require SECURE_NAN.

NDP Request/Response/Confirm frames carry the NDL attribute and NAN
Availability, so the device that runs the handshake owns the schedule.
Userspace schedule configuration would conflict with that negotiated
state. Reject NL80211_CMD_NAN_SET_LOCAL_SCHED,
NL80211_CMD_NAN_SET_PEER_SCHED, and
NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS for such devices.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 25 +++++++++++++++++++++++--
 include/uapi/linux/nl80211.h | 35 ++++++++++++++++++++++++++++++++---
 net/wireless/nl80211.c       | 30 +++++++++++++++++++++++++++++-
 3 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index ef8c84aab332..60152bc5aa9a 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5302,7 +5302,8 @@ struct mgmt_frame_regs {
  *	in which each entry maps each time slot to the channel on which the
  *	radio should operate on. If the chandef of a NAN channel is not
  *	changed, the channel entry must also remain unchanged. It is the
- *	driver's responsibility to verify this.
+ *	driver's responsibility to verify this. Not supported when
+ *	%WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device manages the schedule.
  * @nan_set_peer_sched: configure the peer schedule for NAN. The schedule
  *	consists of an array of %cfg80211_nan_channel and the schedule itself,
  *	in which each entry maps each time slot to a channel on which the
@@ -5310,12 +5311,16 @@ struct mgmt_frame_regs {
  *	information such as committed DW, etc. When updating an existing peer
  *	schedule, the full new schedule is provided - partial updates are not
  *	supported, and the new schedule completely replaces the previous one.
+ *	Not supported when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device learns
+ *	and manages peer schedules.
  *
  * @nan_set_non_evac_channels: set the list of local schedule channels that
  *	must not be evacuated for concurrent operations. The provided list
  *	replaces the previous set; channels of the current schedule that are
  *	not included become evacuable again. All provided channels are
- *	guaranteed by cfg80211 to belong to the current local schedule.
+ *	guaranteed by cfg80211 to belong to the current local schedule. Not
+ *	supported when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device manages
+ *	channel evacuation.
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -6417,12 +6422,28 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
  *	ranging procedure, including ranging session setup, update, and
  *	termination, FTM protocol and procedure, and ranging report.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_NDP: Device offloads the complete NDP setup and
+ *	teardown handshake with its peer, including NDP Request/Response/Confirm
+ *	and security handshakes. It negotiates the NDL and manages local and peer
+ *	NAN schedules, including NDC and immutable schedules, ULW, schedule updates,
+ *	and evacuation of its own channels. It assigns NDP IDs for locally initiated
+ *	NDPs, derives, installs, and removes PTKs and, when requested, GTKs. The
+ *	device creates and removes NDI peer stations for offloaded NDPs. Userspace
+ *	must not configure NAN schedules or add those NDI peer stations or their
+ *	keys. The driver implements @nan_ndp_initiate, @nan_ndp_respond, and
+ *	@nan_ndp_terminate callbacks. It supports %NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_RESPOND, and %NL80211_CMD_NAN_NDP_TERMINATE, and
+ *	reports peer requests, setup status, and termination with
+ *	cfg80211_nan_ndp_request(), cfg80211_nan_ndp_status(), and
+ *	cfg80211_nan_ndp_terminated(). Secure NDPs require
+ *	%NL80211_EXT_FEATURE_SECURE_NAN.
  */
 enum wiphy_nan_flags {
 	WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC = BIT(0),
 	WIPHY_NAN_FLAGS_USERSPACE_DE   = BIT(1),
 	WIPHY_NAN_FLAGS_INSTANT_COMM = BIT(2),
 	WIPHY_NAN_FLAGS_OFFLOAD_RANGING = BIT(3),
+	WIPHY_NAN_FLAGS_OFFLOAD_NDP = BIT(4),
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index bc70a8e31af6..3406e37df5c4 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -397,7 +397,9 @@
  *	%NL80211_ATTR_KEY_IDX, %NL80211_ATTR_MAC, %NL80211_ATTR_KEY_CIPHER,
  *	and %NL80211_ATTR_KEY_SEQ attributes. %NL80211_ATTR_MAC represents
  *	peer's MLD address for MLO pairwise key. The link to add MLO
- *	group key is identified by %NL80211_ATTR_MLO_LINK_ID.
+ *	group key is identified by %NL80211_ATTR_MLO_LINK_ID. For an NDI peer
+ *	station participating in an offloaded NDP, userspace must not add keys;
+ *	the device manages the NDP keys.
  * @NL80211_CMD_DEL_KEY: delete a key identified by %NL80211_ATTR_KEY_IDX
  *	or %NL80211_ATTR_MAC. %NL80211_ATTR_MAC represents peer's MLD address
  *	for MLO pairwise key. The link to delete group key is identified by
@@ -430,7 +432,9 @@
  * @NL80211_CMD_SET_STATION: Set station attributes for station identified by
  *	%NL80211_ATTR_MAC on the interface identified by %NL80211_ATTR_IFINDEX.
  * @NL80211_CMD_NEW_STATION: Add a station with given attributes to the
- *	interface identified by %NL80211_ATTR_IFINDEX.
+ *	interface identified by %NL80211_ATTR_IFINDEX. For an offloaded NDP,
+ *	the device creates and removes the NDI peer station; userspace must not
+ *	add a duplicate station.
  * @NL80211_CMD_DEL_STATION: Remove a station identified by %NL80211_ATTR_MAC
  *	or, if no MAC address given, all stations, on the interface identified
  *	by %NL80211_ATTR_IFINDEX. For MLD station, MLD address is used in
@@ -1396,6 +1400,8 @@
  *	channels that remain in the new schedule keep their marking, channels
  *	that are removed simply lose it, and newly added channels are
  *	evacuable by default.
+ *	Not supported when %NL80211_NAN_CAPA_OFFLOAD_NDP is advertised; the
+ *	device manages the local NAN schedule for offloaded NDPs.
  * @NL80211_CMD_NAN_SCHED_UPDATE_DONE: Event sent to user space to notify that
  *	a deferred local NAN schedule update (requested with
  *	%NL80211_CMD_NAN_SET_LOCAL_SCHED and %NL80211_ATTR_NAN_SCHED_DEFERRED)
@@ -1403,6 +1409,8 @@
  *	indicates that the update was successful.
  * @NL80211_CMD_NAN_SET_PEER_SCHED: Set the peer NAN schedule. NAN
  *	must be operational (%NL80211_CMD_START_NAN was executed).
+ *	Not supported when %NL80211_NAN_CAPA_OFFLOAD_NDP is advertised; the
+ *	device learns and manages peer schedules for offloaded NDPs.
  *	Required attributes: %NL80211_ATTR_MAC (peer NMI address) and
  *	%NL80211_ATTR_NAN_COMMITTED_DW.
  *	Optionally, the full schedule can be provided by including all of:
@@ -1464,6 +1472,8 @@
  *	keep their non-evacuable marking, removed channels lose it, and newly
  *	added channels are evacuable by default; issue this command again to
  *	change the non-evacuable set.
+ *	Not supported when %NL80211_NAN_CAPA_OFFLOAD_NDP is advertised; the
+ *	device manages channel evacuation for offloaded NDPs.
  * @NL80211_CMD_UPDATE_BEACON: Update the beacon and other templates of an AP
  *	interface, but only that. Same attributes as %NL80211_CMD_SET_BEACON,
  *	%NL80211_ATTR_BEACON_HEAD and %NL80211_ATTR_BEACON_TAIL are required,
@@ -3176,7 +3186,8 @@ enum nl80211_commands {
  *	the update failed.
  * @NL80211_ATTR_NAN_NMI_MAC: The address of the NMI station to which this NDI
  *	station belongs. Used with %NL80211_CMD_NEW_STATION when adding an NDI
- *	station.
+ *	station. With %NL80211_NAN_CAPA_OFFLOAD_NDP, the device creates and removes
+ *	NDI peer stations for offloaded NDPs; userspace must not add duplicates.
  * @NL80211_ATTR_NAN_ULW: (Binary) The initial ULW(s) as published by the
  *	peer, as defined in the Wi-Fi Aware (TM) 4.0 specification Table 109
  *	(Unaligned Schedule attribute format). Used to configure the device
@@ -9250,6 +9261,23 @@ enum nl80211_s1g_short_beacon_attrs {
  * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
  *	fully offloaded NAN ranging procedure, including ranging session setup,
  *	update, and termination, FTM protocol and procedure, and ranging reports.
+ * @NL80211_NAN_CAPA_OFFLOAD_NDP: flag attribute. The device performs the
+ *	complete NAN Data Path setup and teardown handshake with the peer,
+ *	including NDP Request/Response/Confirm and the security handshake. It
+ *	negotiates the NDL and manages local and peer NAN schedules, including NDC
+ *	and immutable schedules, ULW, schedule updates, and evacuation of its own
+ *	channels. It assigns NDP IDs for locally initiated NDPs and derives,
+ *	installs, and removes data path keys (PTK and, when requested, GTK). The
+ *	device creates and removes NDI peer stations for offloaded NDPs. Userspace
+ *	must not configure NAN schedules or add those NDI peer stations or their
+ *	keys. In particular, %NL80211_CMD_NAN_SET_LOCAL_SCHED,
+ *	%NL80211_CMD_NAN_SET_PEER_SCHED, and
+ *	%NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS are not supported. The device
+ *	supports %NL80211_CMD_NAN_NDP_INITIATE, %NL80211_CMD_NAN_NDP_RESPOND, and
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, and reports peer requests, setup status,
+ *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
+ *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9265,6 +9293,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
+	NL80211_NAN_CAPA_OFFLOAD_NDP,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 97ee36dd8b11..4bcb62a0172f 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3200,6 +3200,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -18327,6 +18331,18 @@ static int nl80211_nan_validate_map_pair(struct genl_info *info,
 	return 0;
 }
 
+static int
+nl80211_nan_sched_offload_check(struct wiphy *wiphy,
+				struct genl_info *info)
+{
+	if (!(wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP))
+		return 0;
+
+	NL_SET_ERR_MSG(info->extack,
+		       "NAN schedule is managed by the device with NDP offload");
+	return -EOPNOTSUPP;
+}
+
 static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
 				      struct genl_info *info)
 {
@@ -18340,6 +18356,10 @@ static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
 
+	ret = nl80211_nan_sched_offload_check(&rdev->wiphy, info);
+	if (ret)
+		return ret;
+
 	if (!info->attrs[NL80211_ATTR_MAC] ||
 	    !info->attrs[NL80211_ATTR_NAN_COMMITTED_DW]) {
 		NL_SET_ERR_MSG(info->extack,
@@ -18501,6 +18521,10 @@ static int nl80211_nan_set_local_sched(struct sk_buff *skb,
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
 
+	ret = nl80211_nan_sched_offload_check(&rdev->wiphy, info);
+	if (ret)
+		return ret;
+
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
@@ -18595,12 +18619,16 @@ static int nl80211_nan_set_non_evac_channels(struct sk_buff *skb,
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
 	struct wireless_dev *wdev = info->user_ptr[1];
-	int rem, i = 0, n_channels = 0;
+	int rem, i = 0, n_channels = 0, ret;
 	struct nlattr *channel;
 
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
 
+	ret = nl80211_nan_sched_offload_check(&rdev->wiphy, info);
+	if (ret)
+		return ret;
+
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
-- 
2.34.1

