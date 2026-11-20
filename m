Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164176;
	b=iVe/sdFcJwZfcSPvLXUTpPebHAbrHsVF9pDRUh1oo30FVURJGAjKpzGqeqd8F+A0feM1
	 N5vB57yolq6lRrKs47JiPHxWW3QcnjAUc8lQaSORvIjqgQrV+8f/RT0kanHm4fCZVLjmD
	 hqyVSIoBhrQxq/fFtCLSmKSWXFyLrEA7FpR/YS23bbi4DmaeuvNP+7bnYiJe3VBYrBcso
	 gQ4c72Zj+XOon4WpHGR4hfGCcxdWfyilWx7ms2bxb9cjhnUuRCRc27vxZZOW2RU+dkvH6
	 pUeh8QD93N9oseW9q+R3Ok5arw40FxP5V/r2lk/7tLU4NP4eDSh9oZFbnQ/qeeEu4Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
	b=IH4oBRyFIOBRiM4CY8YUrTfTe/OhiF9CvqOlpCrjHq2pzzpM/GnVP/wgzRYuLgsaXWzc
	 vLVi4Z3s7eB6nr3yfdBIzd1iPYp/aU5jswgpmA66z7TVHFEp56JJUUq2C/xEk45n/ZzfE
	 n7wfr5rPSiZjZMLfEgSzcW740nlx9edYdsqejXwJ9Z79+qrjVmE3l3ce5vVEODVH4qfjB
	 TEYuTI4uJRK41TpHHqnhO7drktwYyIGVGEzQ+enzihtvScjvL7+Fg/F87TcFF+Yn3fEzl
	 xbnmZKqhU5+uoOiT9I1Y7OMTNlxR3iKTVm63dPHAT6MvLXgnwEF3bi4m8nSe14uOeYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FkBWzo7W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZHZ/yJFd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F6606A333
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150F6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FkBWzo7W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZHZ/yJFd
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f18i1048917
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Si9vSiYHm+3mxSuW2rbUZ7
	MDn829iRZrJ39OuehL1dY=; b=FkBWzo7WOI8iorPSIzVQTiDz4EBkqOFDDLdy4D
	uGI4yI3+53Bz0IDQiZA4rmCHxGSNaqPB8361rQGmB/Mgh0/0xunsdW4Q0PsOd5XX
	wSO1gr9ictrTq2PtVu2ZaqQL52b1PiLyT7AbT9TtBy8IIc/kLHVcyLcrcQEHGzuQ
	+ReJCnbGepqD6lKX9Q9kfBx9qvKqBLpxZ+TRbxvx9EIOB0nHrTqcgLYXCbmTSXJl
	jpKG7n+vaEz0MVzbqxw8RjSEz1wPjrrUP1P0Ia4dc6lQY7V1kAIeAgwsDQHdeONt
	ViBpe1M4lGZO+6GvhDRy4KLf16cboEgP2cHNBScFzRNHnAdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagjw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so679126eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164173; x=1795768973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=ZHZ/yJFdJ7PYT7D0dLqth9MeU0BSGAcWHJ25ExUkjsvaE2wYExqYPfHisBPOucxQSv
         3+r1FbgtExBdU4JMJBSZhJWBQpqNdQF9j97L6ilTsgAuL1z6s3UZK65sFPICkPoG1MoV
         nGs6QfWqRaAD3KGXGXOOJRB2rPc6jgqBbkvjsvVyDUYKRt4x3soNaBXTBohoJ6Z7rHkD
         g5ybsUBaDwl8Oc4mu44KbAIgIpQRGgTiQo6uH5IPxoa5uxtp38EQ46ERzPXmIA36xpYz
         4UTObBBF9OnCRcnxzkPgizsjUGmCL9Hd14XMG2KJPNJwUclkUzEOrht9hAVYPK8B3rzw
         vFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164173; x=1795768973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Si9vSiYHm+3mxSuW2rbUZ7MDn829iRZrJ39OuehL1dY=;
        b=HKRTy0rRTExEsqlBTYZx0UhLn9HVaeW/tXz8KqhbElH72vGjU6nhl+tyEHr2tSNfN1
         SDUXQuT8vFMkrG+Pfouh8l+5Df6orajfk5XrH7BVWdjPSMzvO41HJvoedlnNM8J09bIJ
         p37X4tvw6k6GPTZpfXE5Nxf9wxVZr7PfXRgVc5UQTxtM+Z91dvSmmmYgif0gr7BppWBO
         jqcjxUgsC9jpTx4t7Po6iCJjI3ywsnrfO5PKmzR8XF2HPm+SEvIwS1logDos/rrTYoGi
         sffnJNWAu3WGV/mbIdSsbzzbkmTlSa/Nh8ed9Cam6YdDkv7hE7DI2VCBePEBxxknbUDv
         Y3tQ==
X-Forwarded-Encrypted: i=1; AL+hErG6/9Wq2YiYWcg/oM6hMBLVHiIDK0sBbCuzhm0ECig/axHl/FH4dYu1c7YT8TQ+vbB0w93K9beI8Hx7BeMNJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ognqGrYpeTtwA3l7e43EenpvXPnE986POq3wU5EzWzfmjCmg8
	zgfem/+8NTX17aIlePlMTK22mSjO/eU+Jmnr/ZsdFNBDzxMSFE5U/H73I77CMZU1i/8f0LzGaJi
	sL9IsLE+qAngBEvZ9o+PlCpfMakRm3rJ73pDzClg50hc6YQK55NOIR64jnGt3fZsvPcHBiw==
X-Gm-Gg: AYBFou3HBLZSJmBYsTmU5OLRoH3cjsL12XW04/vhDv5D8+65NXDZ3Epq8lqoZiftWAQ
	jIt5vriyaL/qIo2BUyqzGICo8/yvFonpWTtAswpevhPsdaeamYPU4TjB7vTt7ZZxgh6tqxE6muR
	imbAiHo11PFCB9kHQvBUimsRV81GNdeQKCQFmZLhfX1wfq0WRwteC3BD/Yr9yhL3wBGObpitNrZ
	QU1wbvXVVO4UEGjMckFPzufEIFNM88b3fUboIr/BL3wJaU9hLX+pCcyju2PubXFCn8tfDA8rhqc
	xJ1D5G7RK/Pgsxb4MVfIYBh19Kb0LgiMOPOBU7RVtXNEiF2tz6yQAxd9nV9rizTBkSc9FWKeLPL
	EgP0++1CCHf5/dDkd26ztln/QT4FNVIbbJS0+eoNYNvGITPTOaAzcJ/w7yW0iF5IAUa9uDQcf+M
	+LpHw0IxDSL9oFczXGQ7ZdvCM=
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603498eec.9.1795164173242;
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr3603463eec.9.1795164172687;
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:52 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/10] wifi: ath10k: fix recovery and WEDGED
 failure handling
Date: Fri, 20 Nov 2026 00:41:25 -0800
Message-Id: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALYHAGsC/yWMwQ6CMBAFf4Xs2U0sAgn+ivEA7Sush2K2pYEQ/
 t2qx8lk5qAIFUS6VwcpskRZQoHmUpGdhzCBxRWm+lp3xpieFXbJ0J1zww6tb503N/SeSvFWeNl
 +twcNaeaALdHzb+I6vmDTd0bn+QEBvk/feQAAAA==
X-Change-ID: 20261119-recovery-v4-de5f5df13e9f
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=4358;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=EbsyLTJcbPpWwcxoIURRe2OZYEAFI2SV7FBAuQJJT80=;
 b=avs0+hlD1YKlzy4l4tXP7p9jUGKWqgYp4LvMLHweqNRynlFeXk5SMsoY+J5QsQcKo1ronMcLu
 j+vX5FNivOlD2hm2ggpaSEgqrP4mP3ta+sSo33Lr52KLihZwS6d7Wir
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+BOj0DxTikJn
 krdvrOCaPP7bvrB5+MRFxRFUJhLLDm1vobHFvx7XMfJyGyn8LNbxd7tGiFVwCcw7IHUn/IGBBIm
 Kqsyih24JfEUC6PTHeJTR1OBNfZqgcZHaF1rLt9Yz9h1s7cpUifscQXYFx1gnnk/oQPWG0f9X8t
 QGfmEqW7NDbaL9Q9FmLdT/WpWK9GA8Vw67/FuBRUud5enCV0QSFqEb/Vd44y4hKGWTMbLdCuQma
 bvx87KR4pl2vqSH6qfvJQXh2jdQpuDnHVX4H5c6afauQCTbbU537XIypKB/dLctU76WWoC+Guwh
 AKAh3Lhkk7Mj9gSVTJJGzS6cVtWgAZr/OJaKYdLcjNv0mIPy9xAbAv+1yJrkUVr69LYtjTpbTIz
 Ki6NdbZRa1Sm12xmRzj//9S1MOJxxWwClObDDYJfn8kwEF1hQ0k8JLvAr1Yy6Ag2XIwm0B28UIg
 qGopn5+YLbRNziMrVXA==
X-Proofpoint-ORIG-GUID: 4GM6-APyvCV9dHVspgqmKAVpTD1D3pUU
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=Kd7kRZl4A1812afGFBIA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 4GM6-APyvCV9dHVspgqmKAVpTD1D3pUU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX+uudUGdOJaS3
 ReiFJ199EXEssf0+AX+TVoG7qf3Nxw9aioH7OxJa1do4EzzsWFrZpBC6xoDglRpNd7q0cNvJi4m
 AMOQtBjna8tTCtbZ5f+GQF3T9xQtUs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034

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
v4:
- patch 1: replace the blocking wait and the failure count with a
  non-blocking one-shot delayed work monitor, as suggested in review.
  (OFF state), and arm the monitor before queueing restart_work.
- patch 2 (new): shorten the recovery timeout from 20 to 10 seconds.
- patch 3, 6: adapt to the one-shot monitor, no functional change.
- patch 8: reword the commit message to match the order of the
  calls.
- patch 9: fix the function name in the commit message.
- patch 10: describe the change in skb ownership in
  ath10k_sdio_hif_stop() in the commit message.

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
      wifi: ath10k: shorten the recovery timeout to 10 seconds
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake remaining blocked waiters
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures
      wifi: ath10k: trigger recovery on corrupted HTC bundle lookahead
      wifi: ath10k: reject scan requests while the device is not running
      wifi: ath10k: drop async writes and sleep timer across power cycles

 drivers/net/wireless/ath/ath10k/core.c | 130 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath10k/core.h |  13 ++--
 drivers/net/wireless/ath/ath10k/mac.c  |  25 ++++++-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/sdio.c |  85 +++++++++++++++------
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 6 files changed, 204 insertions(+), 84 deletions(-)
---
base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
change-id: 20261119-recovery-v4-de5f5df13e9f

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>

