Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439241;
	b=ldB8xI4jslmB4487fk/TmPoyinSceHI6Ed79cp+pV/CiYPNLGch9gRF0A3FfrqYKkyuE
	 fQH6S+DRXFBJ3OfKHAd+WTvDMbgtgBd3bg/UrIQdiUD4K5eGXSWQaR2eAxEY/3z1p+pcl
	 /E3x/6bhXs2xx35Koodd1om4p9izA0/Y2hRB0fKj4yMA3tHPpwyY1Kb9dcNIvDTRmIkkl
	 Nwdaf3lFbBMrGIrk73JkxGq2zM36AAodVuOtexqkeQ1ngYVlvhwLdqO+KGK87etZOci7w
	 8zRIIqdtP1DAK0sDWedhkzSyStSfY7LRvvj7bBVdNf4z0gTSktwmofBW7Iy2f0/u8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FmLQ3VWVliKQn2ZRJTWFC6BLtQGJIqJZEisRFXqNzq0=;
	b=ZUgm32FjHKYYMJbbzTrPo09JGotMHn/mGpwZBwWMpJJuk3YbzTBrRpYvBu76LgAG1OT2
	 1oQWQNrbuGOYVMxf7uyEmAUqA4rkXj9awK1+R/IMA30Rx+cLu5ATBbOXvgdbd6B86o8Yf
	 W0EtNWBYIb7opIDDGUuue3LvG6fiSEDKiOQJjkGn+VqU1e5jVSVDuPjamap8Lrrayg1Z9
	 sgnESjSpJlb7C4UVAKfk/+nj7j8T2xaRMH9mM0kpN7bHDcCLhSbfu9fK1IN+TSlVOFWRI
	 9yGbQ6oiPpZTOr+Jl1WCvRZP9thd6UnEBsX8XBPIwP3SHSP2eW80D2wCJskGiZqBnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtOzryYc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88630606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 23:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88630606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtOzryYc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so25651865e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 15:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439239; x=1795044039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FmLQ3VWVliKQn2ZRJTWFC6BLtQGJIqJZEisRFXqNzq0=;
        b=PtOzryYcTa9wHfYjTIWpauCYxkYJglLUvXHThOeWOweLgofJZMy9/zsiJddVaZn0jE
         tgJV3vmbZ1kfamsCqwYbpPio++T3w7MM83Bn9QLl0evqzRvPszPhaNJQeSh3LzN7ERVC
         xZO34+4kaHfpOBMt7O75MYCob6pSrXcr6lwlTZ3oVAThHAQMjyDIypLezvEy/TOfCxXG
         9Yiy89hCB9V6fPGyZI7yJLlPSESbA3HNUJOQ4gLSJzysa9ly2smTWnBQtSzKYnr9sJ6c
         zrTm/K8iC44n/DFtkS3dbcOXdgA8Pry5XzIjoRv24J850bCfnYU2bKJ2yIL6aS0gSyK6
         zcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439239; x=1795044039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmLQ3VWVliKQn2ZRJTWFC6BLtQGJIqJZEisRFXqNzq0=;
        b=Vh+usVitdcYHtw5NLSMMImh705yhKgNZJmCkrFn6/0gN+xs0DABvBX5ABsVS17fJKe
         gKSdC5rmtUgA3dFYAVFhVrBOos9q0vhb/3CLwqepzSPglg+hfGBVHIO22SOA2x2G7Tkn
         sDUZSThPmE8FtOZcBOcDc+kydfa+uLL4dovgVx+eLFE5TbEB6eMJn41j6IGqWqj05CL2
         ekjEAXW4a7QTR7TP4sbwnBT5dDDEGFBQi/daRr6PaCeVSSfufMU6rqYBwXpsaoZ5ykJy
         iBDU2JIy+cRe6ZgfB2jAoUJhSEcA4wEBN1GbgSzDfFd0xo/AQ636ihPlg5XpAlZKILYe
         UPFg==
X-Forwarded-Encrypted: i=1; AL+hErHU2On0y25Qukmvx7uWZlBnEyphySPMduzAtw/tkfuOvWLYV4cMgnNZRQWztIf4tce3en9da7kaoyWVwd96gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dVqOGn74K772Mz4QOyoGibdYS2HsAg7JdsScMH3mi29Im+4u0
	oB/Jv+Pe26+sGOdafpXiXG7x5EovkB+g5t2qWOFvDh7IWR0+hFOs1zTr
X-Gm-Gg: AYBFou2hz7bRYhvhGYEo4UcDCqNBqrAh1goiXETDfu+Y5jwyjGrTOFRIpBIHvgRbnUC
	hiUQyXvOpSqEkhbM1FMSGeMCgWmK/btxlTSQDtlbeIe7KwRMIyJ98g0J0aJDixBnTFnjTrV/6rM
	svqf5Do2oTISNWvBkW8KD30GMBSau2Nvo0mdwxahn1WXzztD+PZJbPTckCcjw310/Jv5gBV7saO
	omnxK0/Ek8x/Po2a3FqspBtz1RbdT1IKKkSjzW9SkQOvEIs6I2hb5F7p/0Ahz6WywCBNAc59KbK
	fzRxQdew9F2/HQUAuWk8A8s+URiv9t2uPh4a1okIcla84+VhbCY3HihHi2ijF46o2+soV/PnXhI
	kmYE6Scpn6gdbHD1RLnxs+t95MVVOfNeNsExYr5gXW2HbnGUfaUdmALOnEOcCoTp4aeBVh6fmpV
	NPO6ZPt0JGXJYAhQ/ufwCsRSkm6cmqgqRzc2weib45j3qv+Ox6/PnuCyLQTlokS8BfD6AqQNfnW
	i+lmH/IAhxNiQl25VKdmyGuwXNxEjlyJ9LnCSIFhLY6uXxXBZ+LS4jLFpGuNGVL71YXvH9V23sj
	8ZUS/BAaFEWRA5Vcs48XdhxLH4Jc4Hf4odI=
X-Received: by 2002:a05:600c:4e45:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ba093aa4abmr66726945e9.13.1794439238621;
        Wed, 11 Nov 2026 15:20:38 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm58904685e9.4.2026.11.11.15.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:20:38 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: stable@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Please apply the rtw88 USB after-DTIM queue fixes to 7.3.y, 6.18.y, 6.12.y and 6.6.y
Date: Thu, 12 Nov 2026 00:20:37 +0100
Message-ID: <20261111232037.628934-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

please consider these four commits, in this order, for the 7.3.y, 6.18.y,
6.12.y and 6.6.y stable trees:

  c710c7c2e038 ("wifi: rtw88: usb: route bmc frames via the high queue only for DTIM delivery")
  04cc8c59a3d7 ("wifi: rtw88: usb: bound what the driver feeds the after-DTIM queue")
  185971f1b4eb ("wifi: rtw88: usb: only let the frames a dozing station needs use the after-DTIM queue")
  cf8b516f6765 ("wifi: rtw88: widen the ATIM window while an AP interface is up")

They are in mainline since 7.4-rc1. git cherry-pick applies them to
v7.3.4, v6.18.63, v6.12.117 and v6.6.162 without a conflict; on the last
two, one context line of 185971f1b4eb differs in the include block of
usb.c, so patch applies that hunk with fuzz 1. With the four commits,
rtw88 builds without a warning on all four (x86_64 allmodconfig, W=1).

Since 076f786a0ae1 ("wifi: rtw88: Fix AP mode incorrect DTIM behavior"),
in 6.5, an rtw88 USB AP routes every broadcast and multicast frame to the
after-DTIM high queue, which the firmware drains at beacon pace. Ordinary
broadcast and multicast traffic then exhausts the shared TX page pool for
as long as it lasts: every other transmit queues behind the backlog,
authentication responses can leave too late for a station to associate,
and the beacon reserved page download fails ("error beacon valid"). The
first commit stops the unconditional routing; the other three bound and
filter what still takes that path and widen the ATIM window.

Tested on v6.12.114 with an RTL8821CU AP (USB2, hostapd, one Windows
client in maximum power save) and 80 frames/s of broadcast and multicast
sent from the AP. Plain v6.12.114 rtw88: the free page count at 0x240
falls from 411 to 17 within 15 s and stays below 20, the stack gets about
5 of the 80 frames/s out, the beacon reserved page download fails 16
times ("error beacon valid", "failed to download drv rsvd page"), and
unloading the driver afterwards warns "Have pending ack frames!". The
same tree with the four commits: the pool stays above 400, 79 frames/s
go out, no beacon error, and 3 rejoins plus 10 join/ping cycles pass.

Thanks,
Mehmet
