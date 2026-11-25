Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585688;
	b=O/EtnBUUzmh7j844GQYuibKxFGcJdHRLutqzhQS8LPDufHGAlo1ZBTr3zj0JS32PHURl
	 fm3vY4RnxTjrewsfSKEoMCbH4p2seBZGexYZVKEWtjtH7fyRJRl9WhaUkyqnOvtPMrrnf
	 lmWbWZVOj5Gsgkvuz02F/2OPywHyWMcQoX/AJNbWlS/oMfwY0+1juBwIue0uoJUdvUyNa
	 O5p+dXE96D6AQDsgOPLigyIg77r91Bn79He6H2NeKfM9A6rH372fYNChFTFLEhW4L1c8v
	 JCZLfOjglmoexG8UK5bOGqI4S0zCXwvSXwk/guocsJtpdKX3e/WDUG0+QA7RYycCIoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=xaXw8H/KEC6D79DMI15+BR5UKcW8P0o+1lorgdSIul0=;
	b=lp6Ip3G3vLMFTkGUkWyXFdIisdjgOJbTGDmb3GO2ywkVKMutETadkNDzxnfFV83kJ1Yi
	 XKR7K9KzhsTsBz/AR2LD/3BZcbIbH+WiA/7+nbbnK96ELgCOw1tGy9ljtMN9gU8ze1SNQ
	 PKGsIZ6flUV7sOzkHG5kY9sLtPuUzAH1hsVZVi0T2gecUfwa1gv9b/h5FHqV/yv9inZNk
	 Bbqqy/oVaAwnBH7Yb4IcPOOu3ZY3kWNUVE5mBnp2Z4wP5sogx2NtpWTLmxtvuWeuFKhGw
	 CfORIRub8OibH2JzDMabIT1Kl2Fe2JZfQBzqO7bpqujfrtSecrnpVSnnxZc05C3Dn4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LpcXiiaW;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE12606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 05:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE12606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LpcXiiaW
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so6218842c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795585687; x=1796190487; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaXw8H/KEC6D79DMI15+BR5UKcW8P0o+1lorgdSIul0=;
        b=LpcXiiaWL32fMUIKlrzgVSo72NvjJxnUilEAfNO09klm3to/6/dz5C6HmC9Dy1dVX2
         35WwPFVqPu4NtNPmFbP1dtv/N74xCuIzcPt0Fj14jTFCDJ1rajXSpR9S2HxzdYDWXcd+
         zx3z0N1C+xNeiA//rAY/5a165CaMgAxsb9Mv4l1XFeUrmM9p1ag3xTqChpli1W3vs+nf
         Z71LrWabDm8ialocDcX9VSbKMQkfPZ+QiBtLOnD0tSEK0P9GZCrzc3rquYF839wHb+G1
         lxY/yYxur/JXm38ZYEato1PueJqCpPOmsKlFFM1WAJcKQwpb7mGJGPMVoD3Rl+RSTmv+
         pKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585687; x=1796190487;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaXw8H/KEC6D79DMI15+BR5UKcW8P0o+1lorgdSIul0=;
        b=AV8UFITK8SxYHVPu0D23HpsTcZ88D80r1hnf+SlJPDQRGuoOjnbhRFASC9foqztA/e
         flqQ32tkGm3iwg0pALBRf13G7IgihOEIJF2COO+VJFrzLoE6RiqhW9yuyLie4mIqCkK4
         04abTtDoBalBLAQgY7SpMeMRLUTjnbSPYPAJVZe+Z8wxAHs+wICV9EqtATBUWeTSnUt+
         RjVgtUTaxQWDu/39bYcKUGEdKlUNIWD6bd17j+5b1CqlQr/QOOVl6Pqr4aqTAVB4Cq47
         2/1OssnRHpU9H2Omro0vqmg5BC9yud6AsiEBhblMkDX9BU5akIjD34AH80E2GIosWILf
         HRuA==
X-Gm-Message-State: APuU4Z8o4hu0BxQBOJWfJ0qzx4cWNs16ro4d6bNFU4SrePgp6YkLP6r5
	jwfZ8px56Mfrc1Tlwpd3c/0VHJ9labdbIsbXj7U9L+MhQGV/ZpzdZa2BIQaouW6Wmz8=
X-Gm-Gg: AZFdTZer6jJVcD/iJD5st5bUBQHPzmFRdOLrWv4TJnyi10ZnQPaPyEyUYPFKwRzjk1d
	41GZ7sF0Payj+U+qBrcG4qounFkAoV1FBhc4jkExiZE0apOyjgtViYS7hRBJ1Blk3K9hXGhuWQ5
	6pxmUrJhyk86abL1p8gvylP8vKvVCNowxzCQUALE7RtIKbJDOFpfGAA21MlmFET6IgCsJtKSADU
	cpgi3dspZZC6m1Nz2i+PWqH2uITqyomd4t4zX+bInAxui9sp2yGBk2SxVwbs+SvzczzsWCEkCRF
	gxcW3cB6B91HYr1vURxQ28JFlyHsmYk64s3XglQAkyPuXI/LQVggw1e5ql7YwGLl5tUeMWXM8qY
	oUpsruaT1woYTctwhIPG5JIEpjDMEG9iiz7dwE8ak3m2D14DT7FUdUyH8kTtLL0JyVgPCGWllwk
	fW0YfthjcvkitZwTc6sa1q9zTQLbsHp4kvSJJVn0ZHAVG6LsC8jAZkVrobj0UzocYTUstxhC8dG
	VOIoO6hStPmum+3c/oRNCbJBLlnYadviTpDAW1izxiHH+2/75zI8TLfMSvznYRrKP2ev/xtznDG
	L6BcaZPn1ZfRBblL6bwtJtDmkhJ0pZMPeSX+3fip8aUiDmUIPKwU+aEYTUdfuder4D7gmA==
X-Received: by 2002:a05:701b:4510:20b0:1b5:595f:4236 with SMTP id a92af1059eb24-1b5595f4800mr15583636c88.35.1795585687112;
        Tue, 24 Nov 2026 21:48:07 -0800 (PST)
Received: from localhost ([60.227.220.243])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm62181758eec.5.2026.11.24.21.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:48:06 -0800 (PST)
Date: Wed, 25 Nov 2026 16:48:02 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, dan.callaghan@morsemicro.com, 
	arien.judge@morsemicro.com
Subject: pull-request: mm81x-next-2026-11-25
Message-ID: <tsy7u6eoed2hejjgy37qluj3nyr26f3e4vzxjcv2fopg222rir@g62blffbfxit>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

first mm81x PR for 7.5. Fairly self explanatory as per description.

Please pull and let me know if any issues.

lachlan

The following changes since commit e1dd8486807c1acf9551250b7f81e116a21e6ad6:

  Merge tag 'wireless-next-2026-11-16' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-11-16 16:38:13 -0800)

are available in the Git repository at:

  https://github.com/MorseMicro/linux-wireless.git tags/mm81x-next-2026-11-25

for you to fetch changes up to 923fba07c85576d7e304996e3bcfbcecc9d6aed3:

  wifi: mm81x: stop using linux/gpio.h (2026-11-25 10:25:12 +1100)

----------------------------------------------------------------
mm81x 7.5 PR #1:
- rate selection improvements
- support for v57 (2.2.3) firmware
- miscelaneous fixes all over

----------------------------------------------------------------
Aamir Ahmed (2):
      wifi: mm81x: validate packet length in mm81x_yaps_read_pkt()
      wifi: mm81x: validate response length in mm81x_cmd_resp_process()

Arnd Bergmann (1):
      wifi: mm81x: stop using linux/gpio.h

Lachlan Hodges (6):
      wifi: mm81x: don't rewrite MCS0 rate entries to MCS10
      wifi: mm81x: use the default mac80211 TCP pacing shift
      wifi: mm81x: use guard(rcu)() over scoped_guard()
      wifi: mm81x: use the BCF size advertised by the firmware
      wifi: mm81x: support v57 firmware
      wifi: mm81x: drop probe requests received off channel

Nev Young (3):
      wifi: mm81x: mmrc: update evidence only for processed rates
      wifi: mm81x: mmrc: precompute lookaround candidates once per cycle
      wifi: mm81x: mmrc: cap the third retry rate at MCS4

Sam Chapman (2):
      wifi: mm81x: mmrc: don't credit failed frames as successes
      wifi: mm81x: mmrc: widen attempts field to hold firmware retry counts

YuanZhe Liu (2):
      wifi: mm81x: kill the bulk URB when the wait is interrupted
      wifi: mm81x: report a failed command urb to the caller

 drivers/net/wireless/morsemicro/mm81x/command.c      |  30 ++++++++++++++++++-----
 drivers/net/wireless/morsemicro/mm81x/command_defs.h |  38 ++++++++++++++++++++++++++---
 drivers/net/wireless/morsemicro/mm81x/core.h         |   1 +
 drivers/net/wireless/morsemicro/mm81x/fw.c           |  27 ++++++++++++++------
 drivers/net/wireless/morsemicro/mm81x/fw.h           |   3 ++-
 drivers/net/wireless/morsemicro/mm81x/hw.c           |   3 ++-
 drivers/net/wireless/morsemicro/mm81x/mac.c          | 158 +++++++++++++++++++++++++++++++++++++--------------------------------------------------------------------------------
 drivers/net/wireless/morsemicro/mm81x/mmrc.c         | 257 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------------------------------------
 drivers/net/wireless/morsemicro/mm81x/mmrc.h         |  13 +++++++---
 drivers/net/wireless/morsemicro/mm81x/rc.c           |  14 ++++++-----
 drivers/net/wireless/morsemicro/mm81x/skbq.h         |  22 ++++++++++++++---
 drivers/net/wireless/morsemicro/mm81x/usb.c          |   5 +++-
 drivers/net/wireless/morsemicro/mm81x/yaps.c         |  17 +++++++++++--
 13 files changed, 314 insertions(+), 274 deletions(-)
