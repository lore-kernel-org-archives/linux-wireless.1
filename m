Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285183;
	b=fW5nQm1+sg0G9VZTaaoO+VtrMmPrqF9Lq/VoW5RuRPG5fhkzhmRSGSdut276Zj2kRwUk
	 7dqZX7XF/zdkhqdtj77ytxUJio4iftCS8+KHtGGmHDXYbGkceZn/OhCgPpMviN1gyNNGR
	 +T3T/0Od3Bs2hQsLVC0Q5x+CQc0LY06l9dxMh4rMMeD5dFUyU9zL8ArAoNLxTRIrRGEpB
	 33qUVY7/4XchI0bUO4HyquosqypCLcSmJMJ7+1+aDaA+IWIXNC1ccQ+RnmDXTvaT7KsKU
	 P0VLI8lzoWwpnz7eD3es7BTnU0h1+/0dSQmxhA891FAwiNG2ROdH3+9M6LVxNjOr3aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=//3gNVjiAsaPe80mTWfLZA/svWOGHFf6xoYhw8jESEE=;
	b=WQ/6u+wcN/nNOrXgE4EasvnyS8AvnhksK5rwfVCDnf/zt1/TheDTE1jjntBeEd7BzQuy
	 HvRVUkctuCngJLJVfuZLKwle0OowAwlmMTWbNU3YvIK+yI+8//hyPW5E/QGU6croeanzx
	 no1IwmaL0bGPS7sVy6ku1wA3M1BY1IfPCev2RlB1DpnUEtEqmibOIVFJFHBMQ4x/qG8M5
	 dgu5uLJxMoYOPnw/1kDkajnkFaJS6JUpWQJHUe71QVfBA3acM0FNFkDc0uw158VBr2vpK
	 X9mIj53MaA+ZtnW2jZ42WQHVQqR2rdIqxY0zt8Ez0NO/IM9cp7vaH+7mbKd3RJTwUdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QS0iEkjY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdIHTXUL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3F606DEB4
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D3F606DEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QS0iEkjY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdIHTXUL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAVB2928612
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=//3gNVjiAsaPe80mTWfLZA/svWOGHFf6xoY
	hw8jESEE=; b=QS0iEkjYB4Z7J5GuLVVKaCnAiRrr1QqoIvdIW9QCwWXWZoWGXRk
	zlmkQp9R4DA+9ijkjoWIyiLrh0NKWy1yB8GKPGLqAPAvHavbPGURH9QtCnYfRl7L
	K2aeeUhNwxau8sBsRWgY/Rh5VxJBk3RLxsZNrgR7uCP8mm8AU4TahdxbzhV68lcS
	y+b7kqki0l/tOMfTGwlSvR4ZmzcQF2HDgI0yynkPw0z1Pq16j4WB8J1qQydAIuXo
	vS43gjf+yH6OIV8hznjCAp2wPlDg8S22azagQ7lLbnjjd0RTR9VwaijEU94ZH5cO
	KsDop+PSyi5VpeIabqZBkmwW347h/FqT34Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82x3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3799496eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285181; x=1794889981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//3gNVjiAsaPe80mTWfLZA/svWOGHFf6xoYhw8jESEE=;
        b=BdIHTXULo0L9xWP509t11sSyPHlZBSP1CwXe11UHC/xDo62hclP2VQPjyzkLN7851E
         Ec62zEggNmKjZhT2UHbTqTC+sADQdHzzBrFJMN9m0mcT+ftwtD5I9rBCZReT9RvcekdF
         rdhgtxsc+EbhTiOvL9MriG8Eq2YNIYWcysXT8f/PdcNYvvdW+6GAaBityrC7anqoF6B9
         bGuVJ5PzVO/mhTTyuPn4yRhTqZ/jilXMgXaGk38BsUO09H4aKwK0DT/a2yMfHa0CEPa7
         0HiDVKDdswlj/LJaSnyCuslr5kpwDYLDwbvPkrQg8TS8x1X2IM9gKaF0WTZ5F85PhSP0
         0CTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285181; x=1794889981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//3gNVjiAsaPe80mTWfLZA/svWOGHFf6xoYhw8jESEE=;
        b=AuB6ztqk0OBang9O3b3ffma4DenvqvtTRbB1K8OljpZgB1B7C6kJtDZcGB0A8DnvKH
         YAY5/Wg/Uay3ItMUQ3lZG4/dQCV5lLNQtPolxymnG4/74YAHrhjW6UKVNSktuvbQMTYW
         bV7czzWIASurX9qQwTo0WdfO+kd2UYUeAmqxPUnUg5PFx3HqxACi27hho/OjdDWwW/6z
         qPJjrCAGylfHVvTvzqohbfewXe1VWC0uCAp3+hHtQFARKU7s2afQXF1orrkreXO6lSot
         y51H3Fp0L9b05Ng3h9unHpK+lEngRoNSf77v+91/7qKkE73SU8/Tbiky9iO5Rr7k6TkU
         pVFg==
X-Gm-Message-State: APuU4Z9C/bpLeBDYNtWe4agcckQQwNtW/Y+gik6IrtchNdHoJOtTnbYf
	cmQp5fx4sEhKhGy7xfiJQ1FpNTN2P6S7qm5b3tFKnAkg9H3s7o1R9go96/frbmMZSDjlrTKAABo
	Ckh+y0hVx7kc7Mmcuqn89kazGYuxJvUKllzjCE+q2m/qRpftm3F6knhmq/YuMvtzhcEDDvw==
X-Gm-Gg: AYBFou14Rg5FC68i6q5JwAyE5b1D3PG9/3xj6JTO/EGEL3TGhx3df/OZF7pVjkxPRtF
	Vc7xIJcrUSP4URKeKKZMMgbiVrMV7TNCHKjwBTPbR0To625Cswuw5RWql2lVijuo6bnVvbvK60L
	fmfLl5ECTRCAGrRf77g5vVzhpkjayTcA9nvbD7t5SM7uoQwTycSNFJGO/Khj0mdcNtJYv1LEtPn
	Z9ddFMthJ86fsEDkUAWpFRO4CZA6xx5sGSp6fK4EHGLNKs/6MYRq9+nfMqyznb9wRW0cX7tcPIw
	hXmrLVqkxCcktvuaMOugFvxoFtRqUi4xZiRxjZs00YjTWCzdHk4tsr6oNpZQX4+qDuax46Rg2eY
	tHZ8McXjL4wN/W1LrgdbhsbiqdPzSAkaVkXqh1c2DQc/W1GbjtKdVBgpN9LtSw33bvk+lISCLdv
	7KdKikWuZUcw==
X-Received: by 2002:a05:7301:150c:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3751f56018cmr1539536eec.23.1794285179764;
        Mon, 09 Nov 2026 20:32:59 -0800 (PST)
X-Received: by 2002:a05:7301:150c:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-3751f56018cmr1539502eec.23.1794285178947;
        Mon, 09 Nov 2026 20:32:58 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:32:58 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 00/19] wifi: cfg80211/nl80211: add NAN offload support
Date: Tue, 10 Nov 2026 10:02:23 +0530
Message-Id: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af29e7d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Sq1dOiAVatUAkWyE7JkA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: T91ETFtIkDpSSPETdLTBUfKMKc8mDOBl
X-Proofpoint-ORIG-GUID: T91ETFtIkDpSSPETdLTBUfKMKc8mDOBl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX86rNmGgsTSCk
 WIe6Cpbq0OaHtL4T/rm9o3kR7blauZZGSVnMKa4UgRD3/gJG3Zds1ecwIuk7RKiLD2/Ma+gnL7i
 zUahn5gY0MWTEvhjRLeQ9rfkDxey4eI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX4QWjya84Ssu9
 jxAqhU31E5OFCc4wOLt3LjQ1+naAfCNX0GvVWPUlePDo94qETGTqThgIUg1hmIAndsGc6CfZAH5
 cXjXvagBCkd2JpewS3LOTjLa3Q3qOTbM374pkbV3jMJia9ZE9CEhbIaBi0lfIfqevEQNLz2IteC
 ZxGE3EoBc+kxrYhzUGK3oWySP5Gjj8oZgvp4TbNtWJEijSwsk/rtR2esDF9hkEP1a943/HRkz8P
 mmSNwgeEyv9w1cvKXDzkQWc27idFMkCgtnOtIOfcfHhNO1hGH66oE7NsOnqkc5WFIouUIHLoabi
 dKCmzzNPigxMLqFLhUVg+QxKl3oxXtvhj8wKmu9lODjiGYBVBV1aQuFMFnQFJg+uvL81gmjB9tN
 WPVS+HDro+4EtVnY9p2daBP8g/Ebkgwq2L9/qhIQpbVrjKQmVg6st5x/B+Zoy+37WcXxzX70dTi
 0V4W8e99ckeTVKGb+zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

Add cfg80211/nl80211 support for offloaded NAN ranging and NAN Data Path
(NDP) session management as defined in the Wi-Fi Aware Specification v4.0.

The series adds interfaces for request-based and discovery-based NAN
ranging, along with NAN ranging capability advertisement. It extends NAN
function and match interfaces for discovery offload, and adds NDP offload
capability advertisement, commands, and notifications for session setup and
teardown, including transport information and an NDL channel request. For
offloaded functions, it allows updating a publish function and adds extra
NAN attributes and group key capabilities. It also provides an Instant
Communication operating-frequency attribute for NAN Discovery Engine
offload.

The new behavior is capability-gated and does not affect existing NAN
operation unless a driver advertises the corresponding offload capability.
Driver and firmware support are required to use these interfaces.

Changes in v2:
- Reject both NAN function add and delete requests when the NAN Discovery
  Engine is in userspace.
- Rework NAN function configuration: replace the generic SDEA control mask
  with separate Data Path, Security, and GTK flags; move Pairing Setup and
  NPK/NIK Caching to NAN configuration. Validate CSID arrays and 32/48-byte
  PMKs, securely free PMK storage, and clear request skbs containing keys.
- Replace per-field NAN match attributes with the complete received SDF
  management frame, its frequency, and RSSI, so userspace can parse peer
  attributes directly. Pairing Verify is no longer a dedicated API field.
- Make ASAP and single-burst behavior implicit for NAN ranging, and add
  NL80211_NAN_FUNC_RANGING_REQUIRED with NAN FTM capability validation.
- Document that a device with NDP offload owns the NDL, the NAN schedules,
  the NDP keys and the NDI peer stations, and reject the NAN schedule
  commands for such devices.
- Tighten NDP validation for local NDIs and security parameters. Let the
  driver assign NDP IDs and select NDP or NDPE based on peer capabilities.
- Add transport information (port and protocol, carried in the NDPE
  Service Info TLV) to NDP initiation, response, request and status, and
  let the NDP initiator request a preferred or forced NDL channel.
- Redesign NDP notifications: use NL80211_CMD_NAN_NDP_INITIATE for peer
  requests, NL80211_CMD_NAN_NDP_STATUS for setup results, and
  NL80211_CMD_NAN_NDP_TERMINATE for termination events. Report the
  responder NDI on success, the reason on failure, and the
  NL80211_NAN_NDP_ATTR_LOCALLY_GENERATED flag on local termination. Deliver
  events to the NAN owner or multicast group as appropriate.
- Add patch 16 to update an existing offloaded publish function by cookie
  and instance ID, avoiding deletion and recreation. mac80211 rejects
  updates because it allocates instance IDs itself.
- Add patch 17 to let userspace pass extra NAN attributes, e.g. the NAN
  Identity Resolution attribute for pairing verification, for offloaded
  functions (NL80211_NAN_FUNC_EXTRA_ATTRS, gated by
  NL80211_NAN_CAPA_FUNC_EXTRA_ATTRS).
- Add patch 18 to configure the group key support of offloaded functions
  (GTK and IGTK, optionally BIGTK, and NCS-BIP-GMAC-256), which the device
  advertises in the Cipher Suite Info attribute and, with NDP offload,
  establishes during NDP setup.
- Patch 19 (Instant Communication frequency, previously patch 16): check
  that the frequency is an enabled channel in a band supported for NAN,
  pass it to drivers as a channel, and reject it without an offloaded NAN
  Discovery Engine.

Changes in v1:
- Add a 16th patch to pass the Instant Communication frequency for NAN
  Discovery Engine offload.
- Reflow the NDP PMK and PMKID kernel-doc descriptions.
- Remove the extra blank line in include/uapi/linux/nl80211.h that triggered
  a kernel-doc warning.

Kavita Kavita (5):
  wifi: nl80211/cfg80211: add NAN ranging FTM capability
  wifi: nl80211/cfg80211: advertise NAN ranging support
  wifi: nl80211/cfg80211: add support for request-based NAN ranging
  wifi: nl80211/cfg80211: add support for discovery-based NAN ranging
  wifi: nl80211/cfg80211: add ranging results to NAN match event

Shivani Baranwal (11):
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
  wifi: nl80211/cfg80211: pass Instant Communication frequency for NAN
    offload

Vinay Gannevaram (3):
  wifi: nl80211/cfg80211: support updating an offloaded NAN publish
    function
  wifi: nl80211/cfg80211: allow extra NAN attributes in offloaded
    functions
  wifi: nl80211/cfg80211: add NAN group key capabilities to NAN
    functions

 include/net/cfg80211.h       |  451 ++++++++++++-
 include/uapi/linux/nl80211.h |  366 +++++++++-
 net/mac80211/cfg.c           |    4 +
 net/wireless/core.c          |    4 +
 net/wireless/nl80211.c       | 1230 +++++++++++++++++++++++++++++++++-
 net/wireless/nl80211.h       |    3 +
 net/wireless/pmsr.c          |  110 ++-
 net/wireless/rdev-ops.h      |   48 ++
 net/wireless/trace.h         |  421 +++++++++++-
 net/wireless/util.c          |    3 +
 10 files changed, 2588 insertions(+), 52 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.34.1

