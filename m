Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327247;
	b=oHTCggpCvni+Ys647ZUOrrP6ioTOhr/CN+yE/71vGs0ELDxp0sZeM9cSO8sW94f6m3dv
	 qCZWKLLbB9JVGgxaJrTX5NOx1q0A5yGe3xagv4tVtXb92rYKtLB6q91MViSCCqdd2KJt6
	 Zt7TpQwtMtpoPQYMjsNDQBtTDsnEoIQjy9RwDsWupB/YVed7pr5ruSfP4L+9wXNNOHTiu
	 vVLOCbubNtmuHYDXUwmxrxSdFQxqwOl5wuWV1UbZ/mktJgWHVN9My59B6FjaMnNENWBha
	 LYPFLiCC7U4QGzwWj4TQ2DcMTjf3D9DHJPItEjDNpVRJjuGxGX0Fidbexn0fUq3sKOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327247;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=wsvjdxOQn/1X1MJYUnb/murRd6jD/GcsXFZzpplZsLk=;
	b=X61XgFC/2R/f3oRk/ldcc2nxYfQyY5zFdHmovbKUc9ED1XGvNLkCC6qu03hQzNmQz0qL
	 CtrgWVN+didqsWJs67ohgWgEH7/hDWD7ncffkJdNxsWB9XOYK5oOnN57bxepu94fd6evO
	 cUQvvHz5n5TlfeQgjYgilJr3wQONBOe0OtJ0hqYISJz0Pt8UmJRYlbrcC0asndqcRetT/
	 UFxfdilFK6onmgw3KRGDMBorLNHFQDxqzEizFUPo9M/l8hHt9v2oRGYNPYpai1Dzx7oLt
	 GMeXECkp1jY7v/r+Y0aN/JRjBpRUMESgDrhb4WCkVV1w9Z8bbFfwO5UjKg/AjDh4EQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RZ7wuxAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A5606A320;
	Sun, 22 Nov 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RZ7wuxAS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327246;
	b=GdNPUuVCRYVhDnIAsZpcWjdsdQS/DD5ansQJhUDpJlDRAO4BtUrxm9jMXax6wcBUx2TW
	 q5b5MM5Ln6m+oJs0mi4U4BCtmKd1WcJwD5pPlyxdrRWc+ZJXRRQ9M0d4fgWf8kIHWfz4N
	 7z6JrVaCuF47tJ5I5/nflcuq6IurZC2POWiosN2sFoa6HOiKECmcccCLi/E0VlOXqiUgp
	 ReEpuB7DSaioMN8OH3iJcmxEAcPdbZL+JXn/9TJiKZZOQc0gVRD6AFLaO2BoHQ36UORFp
	 YbsMu1TPZmNDnWotiD+RIP32Nrg89pjqhWfkws1coXxX5OlRkXWOD6YDJlFLHZFCUug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327246;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wsvjdxOQn/1X1MJYUnb/murRd6jD/GcsXFZzpplZsLk=;
	b=J0s/GpR4XSB4qPl3srffFTAZQFJXnHfhNHDqx7syuq05Twar4wDuxpNb3NXV49V3Jc8J
	 2rnI5vzssnewBXx58E4FT1axmkgnTvoWbAMXgBRakV1U2afjB5x/85G0HbCPjcFdG5j97
	 wcCrRCDRbHAafAQA6erlK7BEIVJSvRtMfDcT3vr6V45w7Dq4JbiNuJoL0go9sUXUR3sZN
	 CGD8hi8OnHoPrOHdyHLGkyzBglBQn0Kb14Z5z8MvCnd/HpIcB+UbtFvbZqaA+Y2oJccTv
	 9Vk3SLqHJDGCxyeHrJNetEkbNcCUor12m80MBj3XTnkYN1t/7dw1cW9ZXMEEghRo3oA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05BC41F000C4;
	Sun, 22 Nov 2026 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327246;
	bh=wsvjdxOQn/1X1MJYUnb/murRd6jD/GcsXFZzpplZsLk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RZ7wuxAScfldB0F59pLWYcWxRNuMnoZwgAp8+OaPKFH0af6hVufJBKsS1KSdskfd7
	 GhJwCceT9DTg9lQCrsS/TxMq5i3Y5U7z46ILPVxBhdhMi1CCZ/nqJcj5bzE0Ewz+Xt
	 JH6WMw4/ch7uw5ybka26/F02dvXSWZPWhBOnkMO8QmO35LZEFOENKOunEAwJGccIz2
	 S24C5XHJM2sj0IR4JfnDjJymsqyEGROmtyhIA8FLlo9K//a0t2aPH4PHMdJUmzv1Dj
	 9Fr171NU+BGzPCtpDqPIKFPPJHpfLt4uyC6rzpavVCePCGmfW+SjI+iDpPnucEtzcl
	 dNQ9Vqv4R/Cfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8B82A4BF6A;
	Sun, 22 Nov 2026 06:00:45 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH rtw-next v2 0/2] wifi: rtl8xxxu: report real TX status on
 RTL8188CU/RTL8192CU
Date: Sun, 22 Nov 2026 09:00:37 +0300
Message-Id: <20261122-b4-tx-status-v2-0-bbfdbd880acf@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NzQqDMBCEX0X23C0miMGe+h7FQ6JrTaGJZNefI
 r571V57/JiZb1ZgSp4YbtkKiSbPPoYd9CWDprfhSejbnUHnulRK5+gKlAVZrIyMbVcYrakqTWV
 hnwyJOr+cugckmTHQIlD/Eh7dixo5bEe39ywxfc7nSZ2L/yeTwhyta63TqjGmo/uQosRwfRPU2
 7Z9AcN8qBTEAAAA
X-Change-ID: 20261120-b4-tx-status-df4722e9679a
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327244; l=2861;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=fOiffa/Ug2IK93HBglcMHi92DVqM0hOHDqACMNCCvxI=;
 b=IheMF3P9M3ntjTqkCD3niLSDDfrYKGFMGJQHPoeMlZY8VIoNrPnleA6PH/UGIFEhHnhTpIduq
 bMBWpgQXIGhB05axH/HJvMWXgzJ3rz7u1xtYNA+P5elO07yArp7CL1l
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me

rtl8xxxu reports every frame as acked as soon as its USB transfer
completes, so mac80211 and userspace never learn that a frame was lost.

Patch 1 stops reporting frames sent with IEEE80211_TX_CTL_NO_ACK as
acked.

Patch 2 uses the CCX TX report of the RTL8188CU/RTL8192CU firmware to
report the real ACK status and retry count. These chips post C2H events
in the REG_C2HEVT_MSG_NORMAL mailbox, which has to be polled, and the
report does not identify the frame, so only one frame at a time requests
a report. Other frames are reported as before. The vendor driver uses
the same report (C2H_CCX_TX_RPT, struct txrpt_ccx_8192c); the firmware
in linux-firmware (v88.2) sends it.

Gen2 chips and the RTL8188EU have their own report formats and are not
covered here.

Testing on RTL8192CU (0bda:8178), by injecting unicast frames and reading
the TX status mac80211 hands back to a monitor interface: frames to a
present station are reported acked, with the retries that happened;
frames to an absent station are reported failed with the hardware's
retry count, including when the retries take seconds; frames sent right
after are not confused with an earlier report. Interface down/up and
module removal with a report pending were also tested. checkpatch --strict,
W=1 and sparse are clean for each patch.

AI tool use (Documentation/process/generated-content.rst): the patches
were written with help from Claude Code (Claude Opus 5.5). It was asked
to research how these chips report TX status (vendor driver, rtlwifi,
rtw88), confirm the report format on the hardware, write the patches
and run the tests above. I have reviewed and tested the changes and take
responsibility for them.

---
Changes in v2:
- Patch 2: move the C2H event defines to regs.h under REG_C2HEVT_CLEAR
  and REG_C2HEVT_MSG_NORMAL; name the report fields as offsets from the
  mailbox and as masks.
- Patch 2: rename the work to rtl8xxxu_tx_report_poll_work().
- Patch 2: group the new priv fields, order .has_c2hevt_tx_report as in
  struct rtl8xxxu_fileops, fix declaration order.
- Collect Reviewed-by from Ping-Ke.
- Link to v1: https://patch.msgid.link/20261120-b4-tx-status-v1-0-abdab21c77fe@proton.me

---
Ahmet Zeren (2):
      wifi: rtl8xxxu: don't report frames sent without ACK as acked
      wifi: rtl8xxxu: report real TX status on RTL8188CU/RTL8192CU

 drivers/net/wireless/realtek/rtl8xxxu/8192c.c    |   1 +
 drivers/net/wireless/realtek/rtl8xxxu/core.c     | 128 ++++++++++++++++++++++-
 drivers/net/wireless/realtek/rtl8xxxu/regs.h     |   9 ++
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h |   6 ++
 4 files changed, 142 insertions(+), 2 deletions(-)
---
base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
change-id: 20261120-b4-tx-status-df4722e9679a

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


