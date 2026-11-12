Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482792;
	b=Y0BM1jWVPzO7/tw+FKAX4yLg7HIvmV2Dl0MQpJJX0Kse1dd/vFLQ8/UQOQJUPlozVsHu
	 V/ttS61ZXoOfJYrEUtaF+Es60DeZ19AuyY5zXNL5Xfjq22nIxntBTLbQ7s/vx2DfP5k3U
	 Mb+gUIcP3v2ilHRIThjsb8s96/+zo3LBLlak8VunP+T3d0ZqaoTI/EAKGlgTqrjWNH14b
	 +AfN81/6/kksjYjPG2axwvIhWBfX0PzNH5+sETGveb/my4wieeMP1hYujylEgTs4OZAPy
	 5Q25QyneX4jKeVIow569hWz4FCpUZVUmdAwdseAxN91XROX8ZyYIJbpNF5+PLLE3Dnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=;
	b=F71jCoNYCj9pK+ZM9sQQj3YekznG0L6oqAgFq0ozi7HulBuMg2bJb569i5DmtMpAK0jS
	 6+jOCqSZc3JCzd+gvdaoy1zvGCXt42zJDDsHls6+1e3r0CcKErBrhXSUxZPNfqe0yh1Nn
	 Zxd9kkOQuWvuRupMiqi6GJVlUuYJtS9OJF2aqlhjHF+oe3hBuCHM43nc9KGaAR5eUmgH1
	 QLIb1af5YKyNrYGqEAr5z+drIjSAYfmzxaIEpRqpMwtfplLBlDnKGZ+d2P84yI8g5JHaC
	 Q5QBq0uqx0hu8w7MomD8XG8uymR2V8XG51RSOoA0ITux/ydUCyTv18+dXTF5J81VMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOzBL7PX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGSxhYVg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC96606B594
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC96606B594
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOzBL7PX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGSxhYVg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACBHQON3893759
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6F9MCcHdTk6Adicb/HWB4h
	SRVzQbjtWaswP0lnHBasc=; b=XOzBL7PXyu1N+xzdIoh4BKM7FnybUJJjJ3rw/G
	rWjTpRKDZCS0gMGBzDEKGTwVvqD4GCJ3kOi8UfztPm1Vrf8LL7gpZqCoHNZiIW24
	QHXPzl+RwMZnc5KiyQT1g9+lKCwnbgZT47BTdfD2htvSfj1l7no2ZqsXhYGBQQPN
	B+WMdLxkey1Oe2CL6FnpFtk5Y/yBzQsds7WWLGE6cg+IzI8s8C8vH2gI24E5JqE8
	IULo1mGQ/Mr6GWi6kmYG0zwarMGiRaqVyrEkNrJgXrnGIGaqlTeTqNPzQpJmuFA4
	d9b5GKjNexUqSCefTdjJ5++jvDN48hG/tus0hzwOarGQOQ8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1bdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so905025eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482790; x=1795087590; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=;
        b=jGSxhYVgLtR9QCulIcRtj1DJ1qo5wGoLYUvPwwWJuWQNlnYuUwr6B3Dg1hnNK1eMmW
         i/ypzb8UP3yo4AManLqlNWSlAx81Pf5jsmTGZ5I+ligaMsbtVYjF0DxcQ51QXC1yyBjt
         WeqabEc79OA3C8Wl+DElLQE3ydlU57lkkTFAWWdxa9uwM+jr+z9p4laIeIqlL4tCIzAB
         4EXFyvZkQzq0X4ah5Z32m+U4zttP9zw8DhIZvozHIdOljZVSVPufoOdhb4ngxc6GEoGJ
         uVsbP1gtPBS1JdTbX/d6RA1vQk/kOgFCBOmAJkNy8oqu6LWWQu8T+pNDc8CoT/JByOOc
         fsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482790; x=1795087590;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6F9MCcHdTk6Adicb/HWB4hSRVzQbjtWaswP0lnHBasc=;
        b=m1mKa6+nXub1bB/p2GYam/KM1b8P1MdZm/k+PvK1IRYjcNPkDRFpPoPIBeI1xaf44A
         c20Pu/T8FbNP2jxZdxTKoR5SeT5f043uIGOIraP5U+Kz9uX47BMJAsPl+xZ7bFP3FuM/
         4qwKN9T4jhZ3U/ImRy7Yxp69BIjxYZYkhALkrE4Lo9I4RI6Rk+YvPjo8TP5QSBiT5kLS
         yKULyVHK0pTGbyY1K/HTM1s83Am/aRU75WXlQzJrcmgEvowndRQtn70ki5jhN1qerezd
         4Nbs6C4eDxI4vbrbtTlspslfXo7jryiyI20oCz2i5PPrVBopuBgmaLwVS3byvq3ivBGG
         B/lQ==
X-Forwarded-Encrypted: i=1; AL+hErGNElj9JEOB2U7RBCg8PSmfqCRS5FZCog+aXVRcNZXhzbpeLdyh5xHCRA4gzy3g/ojJ+WhMTUIzXDoCn4wJhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OLOK0G9niocOHR9ux3Js0gqTrPA6kkp4XeDG3n96k1QM12nav
	2GTL0r8bKEFOp2x0b9x6b832Jo8nVapUVl6qH4KMgiywww+c4g0q8XZhLP4svj12Rl0QkqpIPaW
	fOPNSzOMtlKdM76lv98Rp0lmSxg7CXx01sSuHKC6Fgkz3fOfuw4s91PEmU60PvLM2v+nsLw==
X-Gm-Gg: AYBFou3HxBIjgCE54JNza10cRnA1JJsnKCfqZ94Lh4EqfCFEYnixBpJ8Lvr1wOsmyey
	Tco3rzwLjsTbU7gXwsi3RAUOFDdOk1khjCaLXfVc/CEeQ+QVGl8E1nbzXFhQQd5hNhxBHonTLVg
	82PxrKsuHjKbw1zctd+chatOlTh+3Vbb0whuWwg1hlVlcoF9ab8WjaW15fmfWMExKp3toVzMxYj
	Jk6DGuXd3mrh8KpgaHyBAQWz6fGfsFiuE8wOKjAwZrRrUV28UlGNtgHMhnJIOW9Yrb5otPVoLKa
	ZsjCNk+4AGnhncN6qtWYA3rmmcUVfn5vL+56pKucqv3U1IDBL3Ac8PxVzKqMOBsbWqLjLHEE/z6
	JeQYZGns92vMYMihQ8C9GWTA5SkeJDr9vGnWTxpSm71mp/czuwzIF2qMMUSYa+A2rHaXNpp+iir
	GwHHFt7UnMnqPHPwdwD/qAkjQ5
X-Received: by 2002:a05:7301:35a4:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3768676338bmr5816597eec.26.1794482790256;
        Thu, 12 Nov 2026 03:26:30 -0800 (PST)
X-Received: by 2002:a05:7301:35a4:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3768676338bmr5816563eec.26.1794482789537;
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:29 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/10] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Thu, 12 Nov 2026 03:25:59 -0800
Message-Id: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEei9WoC/yWMywrCMBBFf6XctQNpCqL+irjIY2JGIZVMKoXSf
 zfq3R0u52xQrsKKy7Ch8ltU5tJhOgwI2ZU7k8TOsMYexz4azZM0ykyhOs00nb1JLtmT9RFdelV
 Osv6CV7iWqfDacPs/uvgHh/btYd8/GKVgNHwAAAA=
X-Change-ID: 20261111-10k-sdio-crash-39b0faf282bd
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3778;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=ZHbZYE3B50xecxdqAMcGJfGNqMRR3cy4UogUp9BVJCY=;
 b=jmLNwa6bOgLqY8bI810JF8Wzvo1DAJ3DGUR7lsdhDl9g6FMjZxZnilISk9Zs+P0/RI3/UKm2h
 s0BZ8NRswzEDU8qPky9yqjDunaLDR5v6MhAueFWzRiP5yjBTuaya+tF
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: xE7c4i_3w8M7o18VTAXuzU9mwj_zAIo4
X-Proofpoint-GUID: xE7c4i_3w8M7o18VTAXuzU9mwj_zAIo4
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5a267 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=eKRDW-KPXn0GmfykuQcA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX3VqeRZBhAUsR
 n3CyqorsqdZ3EKtgA3/V4TKC4ePM7Sn8mU6LDTLJCPceRQNYxM+qAwvwO8kwiokzbySWHWLBOAW
 1iKXEIRqay8Z7VQHTIqsRWYiJL7r2lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX8Fd+pIEPsVmd
 MyKbjHb3SCOHT+WO5aux5cKSZt5ylbzEQk+A2B6eRGOqEjS5tAaNQ+0MvjJfnutbS6hKeCcLyof
 RbwtgMnmYk4YXD7ojBlHx35tSL/bJ6iSz73pV5Z+r0n+rZW6Wc35Orw2oGuAZtL8ay+FUGU0Ow7
 ey4+y7pXYdNoEz3FNZm1j4rZTZEovMq7KRbv+DfYnkdcYzLEVVwDXlZI9CNFJBjlwF8lHKor4qF
 X+t7HlSkvmKjCXCtpOdOUDtv9JQDfYeRAqLebBO5Dos7nZHl9WMp+N4ky5RqzET0vMH+urI1DZI
 eUks4epgotReR7oOvpFsb+0/vZNS+YAQO1BBOYiPGfeaboOEtt2dfFLZAdRrtCxBiRXctt0x5Na
 dmmdR+PKgXDA6XcbWnJ8fuNFZifB2ttmOsTmXyx8xsnBaMulGboQtWkbncm4YmxVK96AzeSvcFq
 j0k7tvzwnhzO0ucQ8+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

---
v3:
- rebase onto the latest ath-next.
- patch 1: fold the old patch 5 ("check the recovery deadline on its own
  timeline") into this patch, so the recovery monitor is a self-rearming
  delayed work from the start; move recovery_start_jiffies to patch 4.
- patch 4: reword the commit message; recovery_start_jiffies is now
  introduced here, where it is first used.
- patch 8 (new): on SDIO, mask the target interrupts and start recovery
  when an invalid HTC bundle count is read from the lookahead, to stop
  the SDIO IRQ storm.
- patch 9 (new): reject scan requests while the device is not running.
- patch 10 (new): sdio: drop pending async writes and stop the sleep timer
  and work across power cycles, so stale requests cannot touch the bus
  after power up.

v2:
- patch 3: also wake wow.wakeup_completed, peer_stats_info_complete and
  wmi.radar_confirm on WEDGED; reinit peer_delete_done before each
  peer delete command.
- patch 5: remove the early-return time_after() branch from the monitor;
  in ath10k_reconfig_complete(), cancel the monitor with
  cancel_delayed_work_sync() before clearing fail_cont_count and
  pending_recovery.
- add SDIO Test-on tag.

To: Jeff Johnson <jjohnson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

---
Kang Yang (10):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: bound recovery time before entering WEDGED
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures
      wifi: ath10k: trigger recovery on corrupted HTC bundle lookahead
      wifi: ath10k: reject scan requests while the device is not running
      wifi: ath10k: drop async writes and sleep timer across power cycles

 drivers/net/wireless/ath/ath10k/core.c | 132 +++++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/core.h |  13 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |  23 +++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/sdio.c |  85 +++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 6 files changed, 210 insertions(+), 78 deletions(-)
---
base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
change-id: 20261111-10k-sdio-crash-39b0faf282bd

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>

