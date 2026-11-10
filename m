Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270093;
	b=wihgPyQkcE0QWP0KvsBB8+4yc4spnotJT2sPR6I/tOJwM+FE9UsTAFZkxjlkqU4g48Fz
	 czcLjuSD9Ro4lUQTVyWKoDyMMJdwJ7nv0CnlBQ9TuoPmGNiytJjox82rRjgtXdrcY4+uh
	 ujLrAJZVjzxOWofj2ZwRp+jw7GdisjmO1Xio5u4yNbXSR5n/RyQ2eM/o16oHvwwYT+w+B
	 3ZCm0W/t61xTCa0Hd9MiqI6wzVEygBO2o/nVrcWx333P9RcONCb6iMywcKlM7bxK8cgw8
	 btn+ZhKCqyTkwUCDtBUyfZiJNuAxexVk2fRzjArlh7Pmo1sf8n+yTJzNrjW6Kht2dqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
	b=Zc/lsGu5wqYZTuturNcxkfYD0gXhzQaljrNiJ6oyVq3ukuOuHp01Myidi4GR7oXgK7iy
	 0O3bq5NdiE03+wRcW92K7w6Y9vxDdYIO4rBHCJci+grIMFMb/ZLoDqGNDxOJGr2Jd9xrg
	 vZii+twUtjQkAUOTeCnM4dUCcE+RNuO0vEOv5UclsvKnSmZ4kwLtDoagiwzfKUeo7HtuA
	 4nITHNstrjL6Kwinwv0iVZVF2DTUOI1FoyWJgSA5Y2oL9TmTRfX0gn7nVMXvSMxq94H/r
	 GmKjHJn5o+24fPMpwswCg37lb4Sk8IBAVVWExaHSbG0j/lPm1SGMQwlMC8UHd0joqmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7qWuPVm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100DB606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7qWuPVm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12130585e9.2
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 16:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270091; x=1794874891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=q7qWuPVmbQzoIrN93dX5MW7S4du33xxt/lkFUY3jVbdvhWnnSHyxrJIPDUVyc7A4RV
         tQ+N0j2vXdVRlu+gP5XAU3v5M0Exa18rZungDqVoJi2bwi3GiNQEq/OxVL3g7Bxy6G3Z
         1uSU4iyo6C8f/nvHdvqqPMQO00ItW6YPUqdfmwZ8MZkj+2sQHluz/Y33muTmXdykkpJD
         5qMm2oCjMvEztBUlHDRU2hfsu4ZveoKBd9jM4O6zo89Wlkf+78BQthSpbqN9OkvWQwQN
         btE827OSoWfaTyWngTIl6hqTuAM0tHl3eampCQOYHM5MbLIeKtwC1OM/HRknQbZSckHm
         NhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270091; x=1794874891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=AuB8PTidO4Q9uxvrrXnwBZDRySW+UhScFb7jG21o8nxJgKJzOVxJgxiMLlIcId4OAZ
         kiv1wIShKUSBrFk0b7gOBF2K/aRflA9kJoZTzlUGzbsFKEDkQCDPep9ewRmU7NLKZsmT
         0i6iOavI2zX4QgyB9DsT2+f2/QFH2itmozCGrNB+KNMMwMU6gjayjy/L4S3J8wLdnTTf
         620a3qccpZWtab9IyXi8/ng1rUVhxpb48jUCx7EmBtKnQQjcxgjkd3rJoxIN2HVi6zQI
         9vnNllhvnrg3eiD8ilpcpwAy84Ed7mhIAzfBi+OEoW6JPr3uDh9haGhXkaqqCAE5pUsM
         OSnA==
X-Gm-Message-State: APuU4Z9Txr4B0SOvJDHnm+4EBZjMQ3MD9NPsvKbvclLk/1otakgPmqcH
	bBdAcrz+Mgzdhrkt8ouE1LdbOlduE29GcHzr4R0RUbYSKCXGbfYijYwV
X-Gm-Gg: AYBFou2gcWmpkyNlYQ3NxQ14bNq15ReIXbDD88FxYawWUIZq/EXXXyWzHjvaDJ1RDMS
	N8FIlnHAgik+aMmHiIwvLns/iPoIUXehMjxSytzd9pNAXp2tTgo6h/UUBrPoolmMJQuD7v7cHw/
	wScGb3c/M+ZRiBvmE7+dXJd7hBA8IV38d+XFYhcNG4ERJw6gcQI3LJapJAvfT16Z+zKSuuKBAq6
	0Kf9yL/rjCwAshqsfeJQdRme2oYvCg2oZg805yl8HzFLVGnL2k17muebbx12v20NmeH9U6H9uVQ
	NEdHQvxKSmRqq7lwZR8uO4Jp43mf8fDra+MEWbNfHcEQd4lctX9y4A7YFzDBd0hSAWOK9XX7ROz
	6htgEF47zyzzS1oI5WmAHimim0Fd6zA2nrQ7WRtYsTrn6tzcpeNG9tQ5JsrIyLX+BtfDdEcgN/r
	m7V1u00Zry1O0z3ERQE+OI5T0UDQwMEqo/sIggdrFk9u3hm9X/ORMbufZn99lFrNnjYPzW3XeCd
	tzvGldxW/Oigg7IT7WJxKygQiKxAzFV0hZZKNCYunu28rMe5LdcPcVnRWpYpjCPg41+agIi53mh
	f4ZSikeedSdxwlK9aYnC95S+n75RskGQ3WfQ9lOvWxZYCySjETGkdSOB8cgA1i+SWHIiL49zBAg
	SG6AJMjz1gQS9FPE8ByBUcxtubDbhCLk0caklAH95KoPXzhd7dZtjyqs38gxHoly/BExaZIp3sU
	HRNGeEq8j+uatTyjQiQj3EbFU=
X-Received: by 2002:a05:600c:4f86:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba02340fefmr12950385e9.13.1794270091356;
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:30 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Tue, 10 Nov 2026 01:21:19 +0100
Message-ID: <20261110002121.90167-1-gsustek@gmail.com>
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

QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
ath12k does not implement: a target memory segment of type 0xa (AFC)
and direct buffer rings for module IDs 2 and 3. Neither is needed for
operation. Today the first gets a wrong answer and the second aborts
the parse of the service ready ext event.

Patch 1 answers every unsupported memory type with size 0. Patch 2
skips unknown ring module IDs instead of failing the parse. Both keep
a warning, so the gap between firmware and driver stays visible.

v3:
- 1/2: clear the size in the default case, no AFC case; keep the
  warning; describe only the response change (Rameshkumar Sundaram).
- 2/2: warn for a skipped entry instead of a debug message.
- Rebased on ath-next.

v2:
- 1/2: do not allocate the region, answer with size 0 (Rameshkumar
  Sundaram); former 3/3 dropped.
- 2/2: commit message and comment reworded.

v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: report size 0 for unsupported target memory types
  wifi: ath12k: skip unknown direct buffer ring module IDs

 drivers/net/wireless/ath/ath12k/qmi.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0

