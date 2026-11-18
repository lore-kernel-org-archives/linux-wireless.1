Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983776;
	b=3HC6JSKk51wLQJ8mEl4tZ1RENT3aGM21z50ChgobsrO8cv9Y777MZofPRJpyceUkQ0vl
	 aEC4+KtQZoo9ANJvgDz3oHyHn8LYKdgfcZGgoQ5uxnIxoRFO4mug+pr7xmeJrPxnznoE1
	 AsnwnFeb7bD14W9qFutClZ9RXoXmZ+QuEhMFeU97pvNdHBlSCLFRJvizgR2sghE9tEuoq
	 CQHYszgRWeU8ZAHESoK+xrGZ7IuA3a1xEpUoLHR8NmL8A9Y6ydUbt7dAfg4BHhK/E8BFx
	 go73PGIS4Kw5rhWDsxhRgaPa1NA6O6O6VGTo6UVCAB3YkpV6Sj/tlYwBcP6HxwC57MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UMzqkzPCBJdbs4G5TgzvO7hCUq68qTQ/+bNikvWGVSc=;
	b=fOktBBBTh7E+ioVEaifvJQKANGxvJ2hsnWTWOUWJ6i0v+xX5wfOvPgynwph4wCG0NvPm
	 ACAiJmq+S1VOp0TEwcV8aws0D0coR7a9Bwbi630B4S34Zz+NRZ/Z2lU7il+geoMNZnVkd
	 CxG9nwUH0fGGJMr9vGdoUjdpPWbmxNTznbBuwcI3i092ccTKZCwYy1NVjo8xhsOpQLMAr
	 OVv3f1sRHtMdEhZd/P7d7/ZHpnvF/vp/EXRY7SLOMclmTsgXo1gNjigm0V2V3VP+J7IFF
	 kuBkf0EdZ5NPM1zNozeqCtFUHDBMsXzcqj6I/gWghqMMArBI9BHgdGKVUKHodDMcb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c50L8Kza;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlPF+geI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2317606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2317606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c50L8Kza;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlPF+geI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxQU2602466
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UMzqkzPCBJdbs4G5TgzvO7hCUq68qTQ/+bN
	ikvWGVSc=; b=c50L8Kza5thm65bT8SXmTQ+qyqQz+F9jXPEP2sThvEOYfzkD8bY
	A+iATQzrhGwL9bj1uzv7R0t273Pt/wpmeeQNqtvGfF8DnO5P/F4Z7oZwR+YiBWdq
	Kd5vMEhW20DqRnRVdds/bPuw1S5JY7kvba64aCeXTKQocYsi3ugp/k4ICOxpop84
	Smft1kHV/GlAqgV43LZtMOk5kwjBr9u+nvBteCI2fxh0ULS8Q81PDM0KgbHR2o76
	Q4qSma7E507WBpEDW/0Ot9LrWkayCsciL66pltrgV1SoHfJ8+H01mkGSVeN4yyoD
	SiNOcqo2jpUg6YH5ZRKkYdRK1BtRlGJ8QeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71kyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so1403426eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983774; x=1795588574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMzqkzPCBJdbs4G5TgzvO7hCUq68qTQ/+bNikvWGVSc=;
        b=ZlPF+geIsSrteX/Lxyy4RaZmD4KNNaYAh6eIdVx3S/fCYvxJArPWNVpyb7gKEtdIUf
         N/pEJ44VZ4QKt6JFOEcWWiw5X9TgEHPh3BwHaXLO70wh460piiqkGmMgYq6Jlonp9RJ6
         37yyGUfdscGjOZ9c7xtutcC5+q/a8ts5hE6GXjOIly7LuXLphT8Sg05M0TTY4Qcjdsm3
         TbrOHzVGE7IkSSAUpyeOpl0rWRYbiUK7pAZ1QrB+ybTpK+jTijjP9LYzh63jVE8DKPbf
         2cD09hHfQPv4QCR2YI8VNK9+xCge02WAplXUcYhJdVKMd4RfGxQ+gfnHfmDKZd3ZNd+Q
         MOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983774; x=1795588574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMzqkzPCBJdbs4G5TgzvO7hCUq68qTQ/+bNikvWGVSc=;
        b=nsyU/gVB/AK4YMXTPnoN1qWUx1SHfeLkJYzAWrbBxn3W5tH8HrCjCKSvO3w4GhzeLi
         yKpaqkljOaenzoZGhtTNCliW0UQG1Sw1SiCiEJcDXH1gfH0AHUCuoQDq3W0tgmSU1dJn
         6TQtoDjObcvs7t2mLxTIPbsD8nJ2cv9XcaVJWD35lfTgfIfVMoAFn+n8d2hwZ29IZ2G9
         1cENCZgh8cvTPtFSL2D90beA74eRu2xPm1v/vnRpNnTFJF0/0H+AH+vgiEw3WXDqQN0o
         nQP2erbx8aW9uNzTo0TLUJbP5BRl0OwnOidKH4iLzUS3+xbtrGphw+IaMQ0ufiIh+6Jr
         hLOw==
X-Gm-Message-State: APuU4Z9TVVYunIwIH28dvoF+v4rThmlPNpfL2Xa9WE4cqkoUiVP9ICyz
	SvcvR2jQ5vG5JGg1L8Rk0sEAkYjRMo8HUODdi7whRXDjwke5fXI9d1z7bxkRjsAMt90A6t4XFNI
	ZSsas1+wF4729YqQm7vcfu9b+BYPrIU/PCkGfPA4NofDbzM8zMTSHzFXE1PTcRTUrqmEGjw==
X-Gm-Gg: AZFdTZdFT9A7hdNmz5p3KIMkTIHmzRW9AAAv0mpjKSK3lw55yAg3eMv8Z7JS1sj+3lu
	5NGtQB7wYN3A3BS8PJpJzflk/i9zvBBPhd/uUMSv0Ns+hSB6Cby5fuQ5QxGFU0SaKKYs4PrAZW9
	/6w+owygQmt8tDpEx0A6ZjZ4AmhxAV6mleViiiIikYL8OKBg9ni+dAF0A3ceONgWva8ryCchQKi
	Xn/kf+Z8DrOLEpzxqziO7+XFL3hMOYlhXUayZ2h5zX/DPvjmjMnIztGPx/zKIWjEPzXXdGzn6wg
	OSybdPIZg/mzQQPeUtRgsxzqAGnumOvWIETPNdGAIS/HE5hBRYDkmW4D8Ih+70uOH1lBIgca21b
	Dt0mvdfhzb9u1bNZK97crk6c9bG6nW6OYQdE673d68gQ8b/lcHUGC1C/d7ZqQB1cD/0vPnXI5m+
	fHtOJLcjDSWw==
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr1842528eec.15.1794983774040;
        Tue, 17 Nov 2026 22:36:14 -0800 (PST)
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr1842501eec.15.1794983773462;
        Tue, 17 Nov 2026 22:36:13 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:13 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 00/19] wifi: cfg80211/nl80211: add NAN offload support
Date: Wed, 18 Nov 2026 12:05:35 +0530
Message-Id: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: xiYL0OmqTqCjD88motK8Gx97R-KWOLJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX8RETkcyQewrv
 peRi+l716GgBiP7u9Np8+6w4ZDiGEkyK/kp7A5qqnsOS2dbABvzAS2B1qVtF4KN6e5liAgmuPy0
 3lz2nq0IZTLOkvjwcz4uJUSw2uJGcs6/eHxAFudWDrvoP464yEH0DYc6+GoCBzjWSg/TYK86gOE
 zGbui7UIjEyLEFe1lJLs0VhyQCW9tOmwwv5kkiKws1iLGKFU4EjCIJ83DNq8wOvIet7G0qV8syT
 lDEwqM4Gy4uexVwBiNun+Jur0eb4qKBJ8NEy1OcdlLPR2IhLMB6+UGGnQ4fUwM8Caxllxa5iDTj
 hBtJQWJphRC/P4SUmcd6RaEqF5CwrH2oG16vFSNbUrDmPpxpw190mc4UZT3bvPix7m8ALkbZKDh
 B0i+t4Kpy7Bx8/Mv6sy4IncJDfAeRyuP//owpFauvdQ/b4K5qJREPCeC8ujKEU21nfhtXtRmzJU
 brmg+m7WjIEoj+42qzw==
X-Proofpoint-ORIG-GUID: xiYL0OmqTqCjD88motK8Gx97R-KWOLJi
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd475e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=MqmUB5I_tK_7xrkCROkA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX//HW0wO0TrBa
 1oBHDqO9xhyKsvWVY7WF6f3rrDB8IMaTKHGePinl9YbX6dQpmvOdM9v7gR+WM0P+8JCp5qE6CJf
 WsT5auzpXdB6nJTZVZ1iJzScYsJndoY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180026

Add cfg80211/nl80211 support for offloaded NAN ranging and NAN Data Path
(NDP) session management as defined in the Wi-Fi Aware Specification v4.0.

The series adds request-based and discovery-based NAN ranging interfaces,
discovery offload extensions, and NDP offload commands and notifications
for session setup and teardown. The NDP interfaces carry transport
information and NDL QoS requirements. The series also adds publish-update
support, extra NAN attributes, group key capabilities, and an optional
5 GHz channel selector for Instant Communication.

Offload interfaces are capability-gated. The Instant Communication
selector is optional and only changes behavior when explicitly requested.
Driver and firmware support are required for the offloaded interfaces.

NDL QoS is limited to the Minimum Time Slots (u8, 0 means no preference)
and Maximum Latency (u16, 0xffff means no preference) fields of the NDL
QoS attribute. Traffic QoS parameters (TID, service data size, mean data
rate and maximum service interval) are not included for now, since the
specification does not define their field widths or units. They can be
added later as optional NDP attributes.

Changes in v4:
- Use strict netlink validation for NL80211_CMD_UPDATE_NAN_PUBLISH.
  Generic netlink does not allow relaxed validation flags for commands at
  or above the family's resv_start_op, so genl_register_family() warned
  and failed, and the nl80211 family was not registered.

Changes in v3:
- With NDP offload, userspace configures the local NAN schedule and the
  non-evacuable channels. The device negotiates NDLs, including NDC and
  immutable schedules and their updates, within the local schedule and
  honors the NDP QoS requirements. Only peer schedule configuration is
  unsupported because the device manages peer schedules.
- Document that NDP offload covers all NAN-supported bands and that the
  device supplies band-specific capabilities and regulatory information.
- Remove the NDP channel request attributes; the local schedule provides
  the NDL channels.
- Add the NDL QoS requirements NL80211_NAN_NDP_ATTR_QOS_MIN_SLOTS and
  NL80211_NAN_NDP_ATTR_QOS_MAX_LATENCY to initiation and accepted responses,
  trace them, and reject QoS attributes on rejecting responses. Report
  QoS_UNACCEPTABLE when the requested requirements cannot be met.
- Build the initiation reply and reserve the NDP ID before calling the
  driver. If the reply still cannot be delivered, cancel the accepted
  setup through the termination callback.
- Replace publish updates through NL80211_CMD_ADD_NAN_FUNCTION with a
  dedicated NL80211_CMD_UPDATE_NAN_PUBLISH command keyed by a non-zero
  cookie. It updates only service-specific information; a zero-length
  value clears it, while other parameters and remaining lifetime stay the
  same.
- Replace the Instant Communication frequency attribute with an optional
  NL80211_NAN_CONF_INSTANT_COMM_5GHZ flag. It requires IC and a configured
  5 GHz NAN discovery channel, and is independent of Discovery Engine
  offload.
- Remove the termination-command documentation claiming that other NDP
  attributes are rejected, and remove the unused local variable from its
  handler.

Changes in v2:
- Reject both NAN function add and delete requests when the NAN Discovery
  Engine is in userspace.
- Rework NAN function configuration with separate Data Path, Security, and
  GTK flags; move Pairing Setup and NPK/NIK Caching to NAN configuration.
  Validate CSID arrays and PMK sizes, securely free PMK storage, and clear
  request skbs containing keys.
- Replace per-field NAN match attributes with the complete received SDF
  management frame, its frequency, and RSSI, so userspace can parse peer
  attributes directly. Pairing Verify is no longer a dedicated API field.
- Make ASAP and single-burst behavior implicit for NAN ranging, and add
  NL80211_NAN_FUNC_RANGING_REQUIRED with NAN FTM capability validation.
- Document that NDP offload owns NDL scheduling, NDP keys, and NDI peer
  stations, and reject userspace schedule commands that conflict with it.
- Tighten NDP validation for local NDIs and security parameters. Let the
  driver assign NDP IDs and select NDP or NDPE based on peer capabilities.
- Add transport information to NDP initiation, response, request, and
  status notifications, and let the initiator request an NDL channel.
- Redesign NDP notifications for peer requests, setup results, and
  termination events.
- Add publish update by cookie, extra NAN attributes for offloaded
  functions, and group key capabilities.
- Add Instant Communication channel selection and validate it against
  enabled channels in a NAN-supported band.

Changes in v1:
- Add a patch to pass the Instant Communication frequency for NAN
  Discovery Engine offload.
- Reflow the NDP PMK and PMKID kernel-doc descriptions.
- Remove an extra blank line in include/uapi/linux/nl80211.h that triggered
  a kernel-doc warning.

Kavita Kavita (5):
  wifi: nl80211/cfg80211: add NAN ranging FTM capability
  wifi: nl80211/cfg80211: advertise NAN ranging support
  wifi: nl80211/cfg80211: add support for request-based NAN ranging
  wifi: nl80211/cfg80211: add support for discovery-based NAN ranging
  wifi: nl80211/cfg80211: add ranging results to NAN match event

Shivani Baranwal (12):
  wifi: nl80211: reject NAN function add/delete when Discovery Engine is
    in userspace
  wifi: nl80211/cfg80211: extend NAN function and configuration for
    discovery offload
  wifi: nl80211/cfg80211: extend NAN match indication for discovery
    offload
  wifi: nl80211: add NDP offload capability advertisement
  wifi: nl80211/cfg80211: add support for NDP initiation in offload mode
  wifi: nl80211/cfg80211: add support for NDP response in offload mode
  wifi: nl80211/cfg80211: add support for NDP termination in offload
    mode
  wifi: nl80211/cfg80211: add support for NDP request indication
  wifi: nl80211/cfg80211: add support for NDP status indication
  wifi: nl80211/cfg80211: add support for NDP terminated indication
  wifi: nl80211/cfg80211: support updating an offloaded NAN publish
    function
  wifi: nl80211/cfg80211: select the 5 GHz NAN channel for IC

Vinay Gannevaram (2):
  wifi: nl80211/cfg80211: allow extra NAN attributes in offloaded
    functions
  wifi: nl80211/cfg80211: add NAN group key capabilities to NAN
    functions

 10 files changed, 2666 insertions(+), 46 deletions(-)


base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.34.1
