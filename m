Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795842258;
	b=rraPWdCuKXbGezlbjP7C5BihRWr3o/HdlupeKllYf0wrGOvvLhIMfUBAWG47ZS2AO6Tw
	 vQ0qY+QFCXndYD2qh/AUDGQalX4R5BAOOpj/bS4LzMNv/xkEVebVmqTAIzxbwta8ZNaTV
	 YAg+U3DurigGhv3O4sF46ugaFBoWlhS9WkKJJ5tYipveQWYmbaI8acgENyfVG+002zorW
	 v2JXUgDaIRX9pzfzDe2WmbiD8B771FLVOeQROCxNDSW3VfTQ7CPLrebDBgREf+5VqaSVx
	 3Oha80B2uuQaUO+bhF4Lz904ZGs7/a3WNfx87tFGhqgdd1umsFjYbhVWF15AYfc3Y/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795842258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
	b=r5oDexSvanM0X06wjA8yi+6j93tutUBpnEKELogS97dQFVzVo/8yfqEPkFhDkTl/GZ62
	 icXU924zR0shS5zW9u5wHli5vG8D8nnpigYXbnJQYzvCPfkBy26tC6OPFa231JiR1NuGl
	 n1yt5xRe3f4GiBtl37VMIIF4ERWQQB/S2FTq3833YOPK1SJsVqfB4KQwW3P+wIFjzZH79
	 1AllJLRZ/rB/NecAPiDcyROxjxyCOmW+irMsn+/TGXoR/uD7LWsXPSTtRb+XZL7++aerJ
	 4sKoiUbLOPaqoT5MWmOyqHqG+4uUGe7JCtCdzEdVsfjyFPzsBY451DooNYeg4gcY/Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHEjTKwF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148E606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 05:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0148E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHEjTKwF
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so12305799eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 21:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795842257; cv=none;
        d=google.com; s=arc-20260327;
        b=VbYLyN8XAWJDLi6O+KN+p8A98MQnZGAOdYd+dXFJhexWeXVflqtx6NcHk4GTDqPejL
         MD0zwJRLKyBlFYe30duwz8CqNrTJGKTJkOza1QjOo7U2xB8W9Wn/9SFokD74k5tHMfPs
         Km3USUWZckTuBB35/g6rzZGfsvnhUI2FJ7uHL8NEC9x4emG2Owr2W0dl9xNLHof3+hLm
         AP/njMBOIvSp7Ml/mWgam4WMF6NmbEyDQdvPhtHaSQpjeC63ypx3vhDNvUwN0VCTRiPY
         ZoVoHmHt8lWvB9+m0ovikr4l9hAttwdvu2U19XFc9xedVJBxIjyFchdwDLHMEN4/715k
         X6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        fh=NTjVzDhIn6f5tSO7kdp2EktMf7zB3hAdElcR4426/bg=;
        b=CZ+S8eBbuu2/QaV1HsJCkDLW9NdMZvyQoKIlLUL9JSAa5ZpwdUYpydIgIKEpBcrgXJ
         gacTJ+7RvjGG5iOMDITKCBHZsevoXjl2C0xlRGbN926c6YxpUgK1mSce2v56dnkIV2oV
         9p0QWwrCsfdguZYoYjCWmOTOua9p2ZSmEmxIa5AdQ43NEcBEXe2rAQQUWDIvGazmTbz4
         AP9f9si6AhjUnf/sBvhJ/pDPB32PkmbsryXHaWHVbg8kwYZwTqjFCkY157PXd27Aavba
         hRv1SlsLw5M9QkRQu+UoCo2NfWdr+KYhWrogdOksfzGnngclJv2DR1ikVCHFQgYXSgz2
         Btiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795842257; x=1796447057; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        b=CHEjTKwFdRP0JEoNMbyhYoqasgHdzWH4VDS9l0IPKKZUg6DhViC/MopbYXdJvQlloJ
         7gl4zIfq7W5lpsAHxosVBGlgT4AyQBtj7gD839P7+3f03iG5fkbjUELr2h0uI4TSZOaA
         6T4SwnOLuQZv+rUPthbixvaplL+Wt306Z/3cL5b5jF9cnvsft0skt0ZDKqX9sZk0G4pf
         A0MF3XZfOw0xCJieWOm76xHEO20xSu437UdOhG6JcqR5pSBVpgG36ONBYtQKYxloJGW5
         CFaad8jIozjWXkNuNGEEh1hiYUiJ/UzVYCPoy7Bas8fxijJALhxpxcF/2Ri3OYXi/R+M
         kZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795842257; x=1796447057;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpDKMQHHhzieIgQFhuqIwkPdgGcBXizCVrKmKXueCuk=;
        b=Cf08sG4xRo3xlkHIWLJSqafyG5ZaWXvS8hfND5SuBvSQCXh+3e96G+iXGjSKKIZpVk
         eHwN+TcBhTVSqpcavViltHwvgKnNGWTD6/+kRa1499s2sBzZ8ZwgRZbrl793sA8jS0H1
         30BXQBLDgGGEHvocb+U6oYXDDH46uLlQH9BKshVtTuAelQz4m5niEccPf7Bs1VlNvVgy
         T57aZYnGXinOJ6lGKhy8rTHhitaJHA/bFINzww/N7gQgRU8SMl4ZwYSD6L/VeZV0x7HK
         vjV4dzAaS7+lMnyTNDBIK8XE+j0aAL+5aTEiQQNegQYpPssQW+DFqfK/WkyL1aLzSL07
         DCbQ==
X-Forwarded-Encrypted: i=1; AL+hErFqHreiY4RDyFaZq+DHvCDQE3D1o2EEUUg5XbI7DBoNJHn/t6eANite6EVEGWx/BsaSlYAVvxI5mRczAHaMdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ERlrrTsGOBNWjzsFNyAFxOK1JwEui2bvD9AwM3N66NC/zVTht
	xOSzUIHjiN+SK5nQ6JNPqOQYvOGHx+G8crr30yY8bn5BgAHANOeeOfqlLviGAP28yHSt/UYp/vM
	DFL54lpV0J9wYw2cKegZ68T3ma6zqBo4=
X-Gm-Gg: AZFdTZeqocYH/i3IHh0bdAdP79be/YPANXad8ZTs8EZ+o96Mm3AApGkBn5Ft7CHHcR1
	Gt5dmn+72Y8kqa+vgkbn1WmZfcAm+gtlkiJQC7D9DdyAJw+gLv3AyZm4CrWHkc/H0BNsjAk9l65
	3/XZhzrjzeAaOq6VPCYi/1fjrgyWPHcrOXBZUu8Nq5oESZIsJ0aNp6UCuFfdnxFxDC+6WcOJiu2
	+RIxalRpsirSzeFWIx22lqeP/GzlidJDRgwMN+JNlQXgsb+Z6o6UAV2SNelhAlrkSTvH8aMNl1J
	TVysZACXVFHKKlkMZW40ckwan7ElbQHTsXUxkvmETn0+yZ0i0h0b4BY+NZmnV4fjJ4jz6RibDXw
	gfuDgHwkx1MLvMqkbreLAeLQIHaU4VqV/0kE=
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id
 5a478bee46e88-3857111f203mr32029115eec.35.1795842256924; Fri, 27 Nov 2026
 21:04:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Henry Zhang <henryzhang62@gmail.com>
Date: Fri, 27 Nov 2026 21:04:06 -0800
X-Gm-Features: Aa3M54pVvds-jmLO6mxXdGpcGHxdZ2l9Fkh6Dz6YWyJMQs1TTPKg3dgDtxduVG8
Message-ID: <CANTW0ypcrw2+BAqVKWQ6BOY2eUDK+D47aXuO1zuwZ1VaYwyvVw@mail.gmail.com>
Subject: [STABLE REQUEST] wifi: ath11k: signal strength fixes for 6.6.y and 6.1.y
To: stable@vger.kernel.org
Cc: jjohnson@kernel.org, quic_lingbok@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Please consider these two mainline commits for 6.6.y and 6.1.y:

  94f228ac4f5b ("wifi: ath11k: fix ack signal strength calculation")
  aadeee47e9d7 ("wifi: ath11k: modify the calculation of the average
                 signal strength in station mode")

Both are in mainline since v6.11 and in 6.12.y, but not in 6.6.y or
6.1.y, which still add ATH11K_DEFAULT_NOISE_FLOOR to the ack signal and
to the average signal unconditionally.

On firmware that reports the signal as a signed dBm byte
(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT), these paths treat that
byte as unsigned and still add the -95 dB noise floor, so
"iw dev <wlan> station dump" reports impossible positive values while
"signal" itself is right. Seen on a QCA6390 (fw 0x101c06cc) with an
Ubuntu 6.8 kernel, which has the same affected calculations as 6.6.y:

    signal:          -47 [-50, -51] dBm
    signal avg:      109 dBm
    last ack signal: 103 dBm
    avg ack signal:  47 dBm

109 is 204 - 95, where 204 (0xcc) is -52 dBm, and 103 is 198 - 95,
where 198 (0xc6) is -58 dBm. Userspace that reads these values over
nl80211 gets wrong numbers. No connectivity problem was seen.

The average signal code was added by b205ce4c266c ("ath11k: support
avg signal in station dump"), so 5.15.y does not have that part; I
have not checked 5.15.y for the ack signal part.

- 6.6.y: both commits apply as-is.
- 6.1.y: aadeee47e9d7 applies as-is. 94f228ac4f5b conflicts only in
  the Copyright line of dp_tx.h; I can send a backport without that
  line if that helps.

Testing: upstream, 94f228ac4f5b was tested on WCN6855 and QCN9074, and
aadeee47e9d7 on WCN6855. I applied both to the Ubuntu 6.8.0-138 ath11k
sources and built the modules against the 6.8.0-138 headers without
warnings (BTF generation was skipped, as vmlinux was not available).
I have not run them on the QCA6390, and I have not built 6.6.y or
6.1.y with them.

Thanks,
Henry Zhang
