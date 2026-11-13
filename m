Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565371;
	b=Y7xtxUzQsr8P97D2sgRrUjRfOc4frQD/vGBQkNo0p0lWaTlu6AOkZ6mDNFTJwpQa0rOC
	 bZAlSxE6iNrkp/2pqTC8jOGL4VgD15QEYV7RmAUivVKdFJjgC/gkgFXwm1Yfjm2NEHqo4
	 bI1IcB9+e3F9DNjgwyxTjb7v4kw6hPDdQ9lRVR4C1BP9Ac98WJSVM2shctvjJcQOWEPe6
	 WZd9LQ6FcFMCfwgmW0SepzeFSH2ES5fElI3cJbpHmfxMm2hfD38qlZ106ySDbrNYS1Cfs
	 WRz9u+8EiH/F6TWO2QwENBxomx4t90K71NN7RF0gPqI6RBosTl3SJutOQHo0z5S07gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Qx8ESQb8qFh3fVlVHJSuywPIR3KWf5giANsVVTBL/ao=;
	b=xHAafZC7Aj7dL92jHzqx5fpySWVg7Wkucy95Gwv1w7aa2nX+PaW7MbUbjm52IZyl5z+3
	 lBonPzM8Qt7L58PWQtjL9JvzYBOL4qFO1ftL+KaAw/Y/ZPAW8/6l+YAnOz/y/woEIr2H7
	 jUlFKw+7pZvVcqaqCHjgieywKgqMwIlsdew2+ZhYt4DL86sk3Ht/b19tgS7tCyOIwXUji
	 q0G2Oe+1AX96djGsVusQnnTC2S8MGybQ+y+CANnbIb6LUILa8pPBLyH0VWFQyN9leojiQ
	 YtRcBErMQxLGjXRjuGol+yZnx700GVE97UvxiUUeJls1Fh29sHqPbDOKysw/VgnsH9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nY/MFFTJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wt+mWpsY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DF606A323
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nY/MFFTJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wt+mWpsY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V2Xu4101697
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qx8ESQb8qFh3fVlVHJSuywPIR3KWf5giANs
	VVTBL/ao=; b=nY/MFFTJ++0C2YTGQtkhxEvI+TbYiUDJdyihfI6GERTNAebbb5T
	qZpZC4JklSHHrvByVycN4S2VymnSwAGGu5FL8zmICwYlyCf1h1py5aZUDJl/fZyg
	42t3fCcdu4KjOEanQ6WBYzVaw6mZski60D1HnYpC2XWiIG2OlHNgfsO2S1bjoO3D
	WjYUbpJ9pk24awL4O9S9rjt/L+mvpkw7JcGCMVD8nOFje+8ekZouP6tTUiDNyg44
	e0+J0FVFs1Ghz4yqzk8v+1jUBNFuRt0uIMYQ5pi6Y4kHTVlS8fahP11C30eWVBnQ
	SfoMr0rkbcx90Wj13u+3sGCDP4YsWKWenHg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjq4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1274378eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565370; x=1795170170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qx8ESQb8qFh3fVlVHJSuywPIR3KWf5giANsVVTBL/ao=;
        b=Wt+mWpsY9lI5XctvJ/VihMNkO5/NOHHvLZ9rSYZZf1zCvBDJuHIGuvTqGjUEsLOnYm
         nfPyNJYnDXdH0+QVbB2XkqHdKWDYswv5hj9Wp91Zvp/jq01XI8UKGTAg/rIH39DOheZg
         4zBhwG/pZccjCrifK67TTPesWIUpQvuYPPGZ6++iS0v+SSmSNspMk8IH9tz2m8lBQFXO
         +QTWSaBjkHoxWhHYsMG+Oh+QMraEmsWIqRqyPWAGm5Ss/65eyVFd+/LbaPXfPPiIxYwN
         z0r/trpqUeCO5OaYQPm6sM5YoF5Aj1eeiLEV+RF67Z/apbPm8WQljFXLwkKPPRpucvli
         n/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565370; x=1795170170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qx8ESQb8qFh3fVlVHJSuywPIR3KWf5giANsVVTBL/ao=;
        b=JCIBDMGJUOZ7lH1rbx8OA7ebuDXlofpX+qdLxzJR/XKIATh5nFA9dofbeUXHL0yHS/
         m3qTndexfPNYJULQ/+ElS4gI7WQPr37bgHzCxbZSodF8TQdoxjY5fc+XlSVTECx2eu4E
         SAPIiKVQKMHr8cT1vDccxH+JZiQTzCuc+2e7zUOqQZ5NL79b9ZZN8X33MWiWcgvWmzsO
         LMe4tk+Uk2U0ZxoA2k4VUNFAXAkms9LwI7HtPVoqVhxNyt1U94SmILsPu0Tnc448RhPd
         1xoPIFRRsP0KXbXw2vTzjxGDrjyT15SlSjcByt4PvCsc48UThsxWP9+Yhf5leCWhU7w2
         TdWQ==
X-Gm-Message-State: APuU4Z+n+qGY4BHn+h2WeMebq7YTt02EFNpL4Ts5FyVTOzFtY5QBdev4
	+xSx6ZXvW////16D3cYHSwgMvHwmKw9JZ6OvK8KFvKYyvwGCEVzOl1r8I1Fh5NRoA5bUusyRepf
	czqfBp/txw1zCiHDEl88HlEy/vwzUrgHW7heOtHttnDQd9OhkfKw1V5nvzLKKAtUrafKFsA==
X-Gm-Gg: AYBFou1IhAQ4cfns0nVD/mIRbzqBKFt3xV5QVX0NQyzpwQxc/nEmNtTFu9DIyjl9EvV
	rMdV8u4lXgfXpvxMhCf+E9kD4s8y8rIK6mWXgGjiEHWUm+R8APjqruLI1TSyWrAgtFtfe29Ovev
	tE8X6K2eMiVzpVr0EakD0S6olmhiROJHKxAIPmxYX1L/RFf4f826v9qjIdMb/w6GHWRIHAGpv+b
	1nr+whVFk920MShF0jmQMLvMmiyL6ZmN4nJrUU6Ql4l/NPKCmlIW0NLqSDl+StEjHGEnmKLI3mS
	G0GuawrVwZjE6a9U242KSZiLsB92I70PiflC4CZ3g32nz4GXrnYXVpQzvsctY7ZlZLaesMPxU4w
	JatgdiudnF/2HksGuFvAE4OIDdfz1lhLzta/vaZ0Gfv9dbdCmeeYl5Nqi2rMGVc86V8lFuoOy/n
	byD186mGbE1E0=
X-Received: by 2002:a05:693c:414d:20b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-3796740e475mr2091136eec.33.1794565369648;
        Fri, 13 Nov 2026 02:22:49 -0800 (PST)
X-Received: by 2002:a05:693c:414d:20b0:36c:d1fe:84ce with SMTP id 5a478bee46e88-3796740e475mr2091107eec.33.1794565368832;
        Fri, 13 Nov 2026 02:22:48 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:22:48 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 00/19] wifi: cfg80211/nl80211: add NAN offload support
Date: Fri, 13 Nov 2026 15:52:09 +0530
Message-Id: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX/ZUCRoe+1imj
 xVIa4UM1I1it985T4pcXI5NhtpPlAnJBRpxphUlmEIfQ0NV1weNkyUzmsfO4+FfQew9JsNsdiNx
 RwM275Q6Z8VwzUWGjpK4CwxOSy+VSQc=
X-Proofpoint-ORIG-GUID: tX1GuW2EXg2FC1dzNTVUc6-URS5LauhU
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6e4fa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=MqmUB5I_tK_7xrkCROkA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX6/jRY1uK8cgp
 ZfhcfrUjsYQWuV3WMPKBawXEpvz4HVRKWZ0+S9Rko3lV3wctjgpcVn6i71R0UgAN0hlT6OdUdow
 t6nWfSywgJC547wcL83/IQpwhfUzJtKTZeyhesPhDLOadlP73MiV4UKqiJ672L2NpvxctGzcKWo
 tijZAIcgFTzOPnn6sbeduuAUaAfSy+NIJOV5OO2cg5SETMQqUtBds7IK19oLpvuG+pphK7iJg+J
 BqpV7FEIRjLezOOAR8THPlFDrtbXyGlWj//VF7Qbjp8L/d14rASqOVgDsWaMkWgL52pHFJ6dTds
 2+MzRNr0aaDLlpxgR5FRMcgIUuF1sm16Di3O/+7X2hR1Y7TE4iJapIhCIeACb40NaixrLvxix4B
 k3tKmB5BdhjAV8g3Dn1nAHGIcuBVXOelPIAJi5VjeNXUbRtNWvj4YQofh+wtsEOvUAA15yH96j+
 wEXLHFX4aOXSP59GjXg==
X-Proofpoint-GUID: tX1GuW2EXg2FC1dzNTVUc6-URS5LauhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

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

 10 files changed, 2667 insertions(+), 46 deletions(-)


base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.34.1
