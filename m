Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565395;
	b=mygnhOGETlo9mg+nmMsyZ6Lhb2UXb3NlmTXUY0p9OOJmZkqibzhfIZUOJGadQfqLeQFd
	 YcKkSHcyaG/tWCexl+XooH+SNu+I/N7a77XBE11hS/9qjGg5hEwVOtks0SZMQ9Z3xG3LL
	 Pjumqut1bpStys6VjmufbsgDTQcIiULC0h1rGOhmyajR4PCb+qXQBnUI6fOH2b2lgUTKy
	 i+ZADurTDFUNaPPvTUgLKBgPX6AtFhr3BeL/73KPtg7YxkwshErp3iMiIYk3I6X574xhc
	 6YelsH/EdP1/jn6tzHmPfgp1wzSYfdjgUlE50FTb2/6rVSLef/fkky4GviXXUCXi3lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
	b=t345joj7t0HyeA6ZxRREQLXMIMAbEV/CrpcVWGBRdZ4kWpOoPjkow+Jodtu0x9J26a5i
	 KkzohQQ7xR6d73pFQHZrv3M5Iwh8Fes9nD3NnGKAorKdKT9HxXzN6k8WREJi2ikP9RElN
	 +tSlMZE6BtccGmgwk9MwdDDqpH9/d8yMjpBJqV2bNiz98outr2ekWMUv+zyjczUVYB0XF
	 kZ+1bF8Pz+KrhF+3uiHqIZ/pfY35fJpwRBKyC2s8B2lSTXNBJ+myfq69nnCbKOfacyBqc
	 p4xZ9OIr3wwU09+fwxIY+5wMWULyAOaqTRLrpD7e/EVTZm3/a8ROzvhpcGRfTh60wOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sit31dGC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRhCG2R7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D7606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sit31dGC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRhCG2R7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VThj1527768
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hg0xxsHsLWT
	xaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=; b=Sit31dGCRQMkKGq5c/UT8v6yCkk
	v5Nf2LffO4EzMy+iTTe5Pnlwx7So3KtOEhOs7qeKIoq7Xj2UdrEuXzfClryBw643
	J9f3DvzmRRtvKXOZ33a3j0oGFJ+LDRfce5Mg/iWp11kIe06oXfo14bKwtp8ORjG0
	zPh3YraOycXkn4f16TpSmo7nJIer77edJG9OouHZgPEOGMBMOf03LiNVfRVsCO1T
	VVSQkKs0vftfg8gkJ4rw3BM5SizOuGxkzTvdvmIDr7gUOtIo4PejwrZAl/HSWWp8
	16cX0KUulxsvz/MSqB3S6ZdaW7PPT+sKuQD+Bi0ZycXXOTNt2soV8HChKSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8tfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1032680eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565392; x=1795170192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
        b=JRhCG2R7gXxsptIZNI3A2Epy8NQxqzanWe7fSemeB9j927hsHJOYvAF4B1s9TjujZK
         3dH7LI9GyNV5wsHWJ3kbKjE7xZzgmo8/yrwc5f6/3tSLG1a4x4OfoHNJ8NjCloLPuUlK
         Up1R8D5qAcqlKKR2yB33hakHhhPpovQszsiV4o8J9bc6nXD8qABTDSiOwyfNlPZm7x+s
         ZBBam+epVydmANTn4PW0d21wtH7XW34PHsfuW1SgcaACl4PB5KncEoV/BGjq78EVpNeY
         EN4pZZGDjmUgZfOb849CyYkdw/6nFihrp71jMBuwYJtticzesEsmwi476/DZYaAuiuW3
         CNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565392; x=1795170192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hg0xxsHsLWTxaYKionkmWS8E8vlKQkMIlVaCp0wEbBQ=;
        b=x+61DBKBrnfGcoRmZFTdbk1eIjj1XWZQ2vsh9wU8TnfP8Y0MhXX8RcAWwRsPLtEJNU
         8q2OhLRxd5ESEq5FDOU5uQAuUa6nbSmIvF9f9HZ8ImkB7h72WySDjx223joW5Q4N2nqC
         2hRQZjisGpQemY2ZYwbTm9a5xqAniO6hWFJHNxm7uXqlFzZTdlokAif6kah2Btez3FbN
         cty6aYGqLPKdiRdUPNyjxFRksEkU/60YIinwg4MpF2rAmD4TqNmyhrhxxXD16ZspGzD/
         xvZIlOamm2K6LbBMN9f/uKDNRB2ghBJ3keY2X2dw3xYKpPmQ4iE0l4igFvL6+QHvNhiV
         FcSQ==
X-Gm-Message-State: APuU4Z+FajC8692O/57/VF5U/NbsnhozCv5e+3lpersL1JAttHAY9oSZ
	28FGcsGFfJoacrawjXw9+iBagj6dgXCb0ShS027hfXSi2fcwqnUvRZgZV+OTlBC/h6ty8MpMY4o
	rS/riMIO5o5c9uvfW2nz5MIrlSOHylgHlmICV0fZAvzE1fwjDN9QFKs1ixe6MQE34WaShDw==
X-Gm-Gg: AYBFou3CnMFfKoTdgPhPBDjqkMmYmlHqqERKIIMqT4H+2IW9xTTfr3XEZWk8R/0pHhl
	sHarXpXeLmbQYp6naoyhEy4G3kSVV5Jn0b+tHSBI/24RtDMDDPdMvEVkRr8kbAC1vXW2huGDrGx
	n6IfecaGlmy+X2l0BA/pKB3JcQ+jCr17tDcDmLNuQj1X51nuQgHE0lNlATSi36xmmE+JgClRULe
	sPdE+i61GdDUkW5gm442LP9+1a/GXCo+KinfMuGnWgcXMuHszXYi7DwGBMHNOHZeoeGgLOawHr2
	scz8CSDmwGm8oHjWqB17W8Tq9jt3/WTWejHwpdy/BGkEULIoOdJuwzLviBLlJzIbfRloHroa9vS
	cDWphad1tYnVh+U5OBBEsBp6XDjEiyP3JyH2w3IwUbnn35NbHVXKqUbhvoHgid2eQ3C/cKRnPql
	M/xB2jmb0fN9c=
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr2119365eec.21.1794565392181;
        Fri, 13 Nov 2026 02:23:12 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr2119340eec.21.1794565391478;
        Fri, 13 Nov 2026 02:23:11 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:11 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 09/19] wifi: nl80211: add NDP offload capability advertisement
Date: Fri, 13 Nov 2026 15:52:18 +0530
Message-Id: <20261113102228.1917973-10-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX/qGstBWqsCAQ
 wFIOgC/ffVaIfuvTEKfBiwTZJIxrc5SW75AymtyqgNmstdeiJ8JVcl/5mA+lPcXwLWMuSDylxn/
 xbeK3j1sC2Vn/sM4cmXPGwHPLgWG5AIqBTucWQhyEpuvW+3floAZS55AEzxG4Y0px3+YnA5ZM/O
 Bk7n99XCBlZQS+pWCuvDehZlnfe4kv/xwWk/podgO9j9gplRDU1JUH8keExlIfxhaxSXDG42Jky
 w6LG166qJp2zVA5YF7wQM2WdVjQe6cSAbgxn+Sn7yEq8EHCOs1OB5j4ZdniCfmD4eCVSJ9cH6Rh
 TIMmdOaH7v63+2yzFeT0pzZAqw7zVTGH7f0AqPEhyQgPOnWBJMS9xYoTH0vNJpLlV5hnBzSnon/
 7QtKWUzpH4m3351pYuhGJW9uMnoBXgOw3C48gyGF8APS3jHcw9GbuBzevss71YxdxsfgdAQV6Om
 Bx0wByDep9N1BQ0cn0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+0gbekgbyW3Z
 Gh3dLBdoiF/xJuKwZ9Z55UuWTQXAJcnRoITzxggQlNF30fliIhN52pa0nYEM8mE+tf0A0I8+CP6
 Zq0JlfvLYHzWtKzKVF7E23VcUEGRrMw=
X-Proofpoint-ORIG-GUID: INvuJknkvsd7WIIV5c7hetSr1fiu2aW2
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e511 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PZigtcPV9FlgwVnooq0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: INvuJknkvsd7WIIV5c7hetSr1fiu2aW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Advertise whether a device performs the complete NAN Data Path setup and
teardown handshake with its peer, including security negotiation. The
device assigns NDP IDs for locally initiated sessions, manages NDI peer
stations, and derives, installs, and removes PTKs and, when requested,
the GTK.

An offloaded device negotiates NDLs for its NDPs within the local NAN
schedule configured by userspace. This includes NDC and immutable
schedules and their updates, while honoring per-NDP QoS requirements.
Userspace continues to configure the local schedule and non-evacuable
channels. The device manages peer schedules, so reject only
NL80211_CMD_NAN_SET_PEER_SCHED for devices with this capability.

Expose the capability through the NAN capabilities response so userspace
can determine whether the device supports the NAN NDP commands and
notifications. Secure NDPs additionally require SECURE_NAN.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 36 +++++++++++++++++++++++++++++--
 include/uapi/linux/nl80211.h | 41 +++++++++++++++++++++++++++++++++---
 net/wireless/nl80211.c       | 10 +++++++++
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9acb657a824e..b1289d5fcd93 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5354,7 +5354,8 @@ struct mgmt_frame_regs {
  *	in which each entry maps each time slot to the channel on which the
  *	radio should operate on. If the chandef of a NAN channel is not
  *	changed, the channel entry must also remain unchanged. It is the
- *	driver's responsibility to verify this.
+ *	driver's responsibility to verify this. For offloaded NDPs, the device
+ *	negotiates each NDL within this user-configured local schedule.
  * @nan_set_peer_sched: configure the peer schedule for NAN. The schedule
  *	consists of an array of %cfg80211_nan_channel and the schedule itself,
  *	in which each entry maps each time slot to a channel on which the
@@ -5362,12 +5363,16 @@ struct mgmt_frame_regs {
  *	information such as committed DW, etc. When updating an existing peer
  *	schedule, the full new schedule is provided - partial updates are not
  *	supported, and the new schedule completely replaces the previous one.
+ *	Not supported when %WIPHY_NAN_FLAGS_OFFLOAD_NDP is set; the device learns
+ *	and manages peer schedules for offloaded NDPs.
  *
  * @nan_set_non_evac_channels: set the list of local schedule channels that
  *	must not be evacuated for concurrent operations. The provided list
  *	replaces the previous set; channels of the current schedule that are
  *	not included become evacuable again. All provided channels are
- *	guaranteed by cfg80211 to belong to the current local schedule.
+ *	guaranteed by cfg80211 to belong to the current local schedule. For
+ *	offloaded NDPs, userspace configures these channels for the device to
+ *	consider while negotiating NDL schedules.
  *
  * @set_multicast_to_unicast: configure multicast to unicast conversion for BSS
  *
@@ -6485,12 +6490,39 @@ struct wiphy_radio {
  * @WIPHY_NAN_FLAGS_OFFLOAD_RANGING: Firmware supports fully offloaded NAN
  *	ranging procedure, including ranging session setup, update, and
  *	termination, FTM protocol and procedure, and ranging report.
+ * @WIPHY_NAN_FLAGS_OFFLOAD_NDP: Device offloads the complete NDP setup and
+ *	teardown handshake with its peer, including NDP Request/Response/Confirm
+ *	and security handshakes. Within the local NAN schedule configured by
+ *	userspace, the device negotiates NDLs for offloaded NDPs, including NDC,
+ *	immutable schedules, and schedule updates, honoring NDP QoS requirements.
+ *	Userspace continues to configure the local schedule with
+ *	%NL80211_CMD_NAN_SET_LOCAL_SCHED and its non-evacuable channels with
+ *	%NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS. The device learns and manages peer
+ *	NAN schedules; userspace must not set them with
+ *	%NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for locally
+ *	initiated NDPs, derives, installs, and removes PTKs and, when requested,
+ *	GTKs. The device creates and removes NDI peer stations for offloaded NDPs.
+ *	Userspace must not add those NDI peer stations or their
+ *	keys. NDP offload is supported on all bands in
+ *	&struct wiphy.nan_supported_bands. The device supplies the band-specific
+ *	capabilities, such as the HE 6 GHz band and EHT capabilities, and the
+ *	regulatory information in the frames it builds. The driver implements
+ *	@nan_ndp_initiate,
+ *	@nan_ndp_respond, and
+ *	@nan_ndp_terminate callbacks. It supports
+ *	%NL80211_CMD_NAN_NDP_INITIATE, %NL80211_CMD_NAN_NDP_RESPOND, and
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, and
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
index 23d19a6e8d81..f22ad0a018a7 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -455,7 +455,9 @@
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
@@ -488,7 +490,9 @@
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
@@ -1454,6 +1458,8 @@
  *	channels that remain in the new schedule keep their marking, channels
  *	that are removed simply lose it, and newly added channels are
  *	evacuable by default.
+ *	For offloaded NDPs, the device negotiates NDL schedules within this
+ *	user-configured local schedule.
  * @NL80211_CMD_NAN_SCHED_UPDATE_DONE: Event sent to user space to notify that
  *	a deferred local NAN schedule update (requested with
  *	%NL80211_CMD_NAN_SET_LOCAL_SCHED and %NL80211_ATTR_NAN_SCHED_DEFERRED)
@@ -1461,6 +1467,8 @@
  *	indicates that the update was successful.
  * @NL80211_CMD_NAN_SET_PEER_SCHED: Set the peer NAN schedule. NAN
  *	must be operational (%NL80211_CMD_START_NAN was executed).
+ *	Not supported when %NL80211_NAN_CAPA_OFFLOAD_NDP is advertised; the
+ *	device learns and manages peer schedules for offloaded NDPs.
  *	Required attributes: %NL80211_ATTR_MAC (peer NMI address) and
  *	%NL80211_ATTR_NAN_COMMITTED_DW.
  *	Optionally, the full schedule can be provided by including all of:
@@ -1522,6 +1530,8 @@
  *	keep their non-evacuable marking, removed channels lose it, and newly
  *	added channels are evacuable by default; issue this command again to
  *	change the non-evacuable set.
+ *	For offloaded NDPs, userspace configures non-evacuable channels for the
+ *	device to consider while negotiating NDL schedules.
  * @NL80211_CMD_UPDATE_BEACON: Update the beacon and other templates of an AP
  *	interface, but only that. Same attributes as %NL80211_CMD_SET_BEACON,
  *	%NL80211_ATTR_BEACON_HEAD and %NL80211_ATTR_BEACON_TAIL are required,
@@ -3272,7 +3282,8 @@ enum nl80211_commands {
  *	the update failed.
  * @NL80211_ATTR_NAN_NMI_MAC: The address of the NMI station to which this NDI
  *	station belongs. Used with %NL80211_CMD_NEW_STATION when adding an NDI
- *	station.
+ *	station. With %NL80211_NAN_CAPA_OFFLOAD_NDP, the device creates and removes
+ *	NDI peer stations for offloaded NDPs; userspace must not add duplicates.
  * @NL80211_ATTR_NAN_ULW: (Binary) The initial ULW(s) as published by the
  *	peer, as defined in the Wi-Fi Aware (TM) 4.0 specification Table 109
  *	(Unaligned Schedule attribute format). Used to configure the device
@@ -9346,6 +9357,29 @@ enum nl80211_s1g_short_beacon_attrs {
  * @NL80211_NAN_CAPA_OFFLOAD_RANGING: flag attribute. Firmware supports the
  *	fully offloaded NAN ranging procedure, including ranging session setup,
  *	update, and termination, FTM protocol and procedure, and ranging reports.
+ * @NL80211_NAN_CAPA_OFFLOAD_NDP: flag attribute. The device performs the
+ *	complete NAN Data Path setup and teardown handshake with the peer,
+ *	including NDP Request/Response/Confirm and the security handshake. Within
+ *	the local NAN schedule configured by userspace, the device negotiates NDLs
+ *	for offloaded NDPs, including NDC, immutable schedules, and schedule
+ *	updates, honoring NDP QoS requirements. Userspace continues to configure
+ *	the local schedule with %NL80211_CMD_NAN_SET_LOCAL_SCHED and its
+ *	non-evacuable channels with %NL80211_CMD_NAN_SET_NON_EVAC_CHANNELS. The
+ *	device learns and manages peer NAN schedules; userspace must not set them
+ *	with %NL80211_CMD_NAN_SET_PEER_SCHED. The device assigns NDP IDs for
+ *	locally initiated NDPs and derives, installs, and removes data path keys
+ *	(PTK and, when requested, GTK). The device creates and removes NDI peer
+ *	stations for offloaded NDPs. Userspace must not add those NDI peer stations
+ *	or their keys. NDP offload is supported on every band that the device
+ *	reports for NAN in %NL80211_ATTR_BANDS. The device supplies the band-specific
+ *	capabilities, such as the HE 6 GHz band and EHT capabilities, and the
+ *	regulatory information in the frames it builds. The device supports
+ *	%NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_RESPOND, and
+ *	%NL80211_CMD_NAN_NDP_TERMINATE, and reports peer requests, setup status,
+ *	and termination with %NL80211_CMD_NAN_NDP_INITIATE,
+ *	%NL80211_CMD_NAN_NDP_STATUS, and %NL80211_CMD_NAN_NDP_TERMINATE.
+ *	Secure NDPs additionally require %NL80211_EXT_FEATURE_SECURE_NAN.
  * @__NL80211_NAN_CAPABILITIES_LAST: Internal
  * @NL80211_NAN_CAPABILITIES_MAX: Highest NAN capability attribute.
  */
@@ -9361,6 +9395,7 @@ enum nl80211_nan_capabilities {
 	NL80211_NAN_CAPA_PHY,
 	NL80211_NAN_CAPA_INSTANT_COMM,
 	NL80211_NAN_CAPA_OFFLOAD_RANGING,
+	NL80211_NAN_CAPA_OFFLOAD_NDP,
 	/* keep last */
 	__NL80211_NAN_CAPABILITIES_LAST,
 	NL80211_NAN_CAPABILITIES_MAX = __NL80211_NAN_CAPABILITIES_LAST - 1,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 8d4e98fcedab..7426d2c8a40b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3223,6 +3223,10 @@ static int nl80211_put_nan_capa(struct wiphy *wiphy, struct sk_buff *msg)
 	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_RANGING))
 		goto fail;
 
+	if ((wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP) &&
+	    nla_put_flag(msg, NL80211_NAN_CAPA_OFFLOAD_NDP))
+		goto fail;
+
 	if (nla_put_u8(msg, NL80211_NAN_CAPA_OP_MODE,
 		       wiphy->nan_capa.op_mode) ||
 	    nla_put_u8(msg, NL80211_NAN_CAPA_NUM_ANTENNAS,
@@ -18359,6 +18363,12 @@ static int nl80211_nan_set_peer_sched(struct sk_buff *skb,
 	if (wdev->iftype != NL80211_IFTYPE_NAN)
 		return -EOPNOTSUPP;
 
+	if (rdev->wiphy.nan_capa.flags & WIPHY_NAN_FLAGS_OFFLOAD_NDP) {
+		NL_SET_ERR_MSG(info->extack,
+			       "Peer NAN schedule is managed by the device with NDP offload");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_MAC] ||
 	    !info->attrs[NL80211_ATTR_NAN_COMMITTED_DW]) {
 		NL_SET_ERR_MSG(info->extack,
-- 
2.34.1

