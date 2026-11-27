Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805603;
	b=Xq4YqoC7/ihWTkk3uB8bzzHhZYuEI1NvufMnPXoV2+GUmkEwPCsJqWworzjvM8KO7qwU
	 LKFOvbb0I69TqApqhV7X3iSOJ1s6yeu0pGK4ONXMOqmKnJw18xWOO3s8cF9yi479r5BGD
	 vp7kbMfFc6P9Y6n/M9pjpwITfi1cFN2dHKXx6DawsVyU+F9NHigT2SljnJ8z68XPXDnxr
	 FCYjY4XZyLE2RKm0hxd2lg9XHzsAzZxK2sqwxu7OcmcZzfSsKdXj0QQwgH5R35X3fK3DH
	 YOGVuTGnAXkhdpOqcGNq2q5nxN4LeEtoVxj4zMFHzJ60gJCkGST7h4L0cOQ82SSMjhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805603;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jOCLTniI505VyhSBbB/4/Efl/GkkBZPUcGuQyaB12HU=;
	b=pf5AMOf6Uby08Ne/wq1hQufNu76MYjKuqJqCf2A8GKG+Hhlmufh+4CtcnkqHCU598nOk
	 f7JeaL0ML2bElDUcUjXCvwKJE+rGqR9Hxq+AZRGRbcDH23k8Wyi4usz2rSfsCqZyN+9uR
	 eeu3ubjmS402fatF4wrx/Ua9cURdb07C7z93pvxemgPELpDsmwWyPd6ps1kVxCzWthIWG
	 er+JijT800n1spI4YFVUeoaiSBlC5ahqzxoqGimoxmGwfZqTJjqaSzTkmfjSG7EcFAuZ9
	 hAhkINhnRIoo2+udJUfz3QR6bzZznQq2r4xvQuOPDZwF7DlswWbEm48bRD16HPiqIKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lw4dfyCC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13188606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lw4dfyCC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795805602;
	b=MCrdH8xu8v2FAslqTAPdc50EpzI9U/XG8uyindsOWoNERNCbnlPzfv4KZ+SR6pdbT/gi
	 jjxWguYSBCLL0BkCzKBM6Uh26+nHCDFbaH63Mg8Qm2rwj2CGikJXbyKdFVHfR7cyu2V/2
	 8HDLZC6n+jsoi/IPPXBsR0qvh1JtyyzObAEuDRWmiOevF4iicl7/xN9zseHzXKEjHjC9W
	 YFHfalJFWCWetDrvNSPNoZK7zvNXeutVihZvRQB5xfGaSy+goQlBamZ9wIhJmnxpRPy55
	 L/MIXs/Xfo2z3YBOVbF9VtAM0+lpyK/0nL602W3wdpXdDHC9O9FqUbHMgE38H0ZLnEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805602;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jOCLTniI505VyhSBbB/4/Efl/GkkBZPUcGuQyaB12HU=;
	b=r2QbCIbpWuleMXzy/a126UtA7Sv713RDnTXK5u350kOm691SKogn3O8c/ATbPSJ3yAmB
	 bksbpg/p6/zYtA25R4BdcrPAVvl8EoCIwloUjXzhZmyskEY7TTu2u1El7F2cYAkfPfGZA
	 OtH5MYPPw65nER7nkZEBD6VHIbVbs+fv8nRT6yWeU+F4tyQpL90c71rHJ6JhIDBrcjXKI
	 GKjrMsBLGUwjWQKaYjAoAWxHviQK9388XSCljL6frHnovHDdeKp1vGvPf1oFHmPTNGSB8
	 ZBov12nkQIYQavg+MXmCmX9XycX/lS7tLE7V7FwHLvid8y1MH1BpIovHcqxH1hkKd1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9FCF1F000C1;
	Fri, 27 Nov 2026 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805602;
	bh=jOCLTniI505VyhSBbB/4/Efl/GkkBZPUcGuQyaB12HU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lw4dfyCC0hlbSb8fkgTTkbArwhUf5ONqnELpaK7jRmqnZKXw+PyukqCQdjmquLUGK
	 +8nXqyJJ2m3FhIudC5utdRhTzsg3cFN4JkaGdbEbX6M4DkZ8EbV1a5AcVBZG5EcgvY
	 EiA+g+gDydqZoWqhplyd02YnK6sXmVcfb7G5k830MLvIebspQXbNPFmjSKVEm4LmYP
	 IFgQTbaPj5RNG9wx5LtiqvsLkXj4nCyfgVNwvs+gGfB39ZP4PuZ1i+EIwu3b2CM4/S
	 aKHapdwG9ig87MCXAGBuOjyogxD73DgzF9IV7W5ySE6DeCAMq/Av73KS7AL0T03MoO
	 w0/6Mx25wFHmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 792554DD62;
	Fri, 27 Nov 2026 18:53:18 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Subject: [PATCH rtw-next 0/2] wifi: rtl8xxxu: fix two retry count overflows
Date: Fri, 27 Nov 2026 21:53:16 +0300
Message-Id: <20261127-b4-rtl8xxxu-retry-v1-0-b263ab1e0d1b@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCMBAFf6Xs2QUTrVZ/RTwk7VNXJMpmq5HSf
 zfqcRhmJspQQaZ9M5HiKVnuqYJbNNRfQjqDZahMfuk3zvktxzWr3bpSysgK0zfHXRewCi3aMFD
 tHoqTlN/zQGovTihGx7/JY7yit++S5vkDn3gGVX8AAAA=
X-Change-ID: 20261127-b4-rtl8xxxu-retry-b98ae3a5e5ad
To: Ping-Ke Shih <pkshih@realtek.com>, 
 Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795805597; l=1488;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=C+fmUZhSRYASAFwtdzlDoSA24tjcNh9wx+DlbYnJRAQ=;
 b=N8E+2lRfJ/F7zWgcxQImZxhCDKs2NaCLgRYgpPmE3y+teyKgWuFlqpDQi5QsJZcDy+OkGqzJh
 zssMs423QpIAZjmjeFod2kwjFTw6irCDDox1NuOmuShCH1MQpQNrABP
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me

The retry count in mac80211's struct ieee80211_tx_rate is only 5 bits
wide, and rtl8xxxu overflows it in two places: max_rate_tries is set to
64, and the TX report passes up to 64 tries. I found these while porting
the injection changes to rtw88, as mentioned in the rtw88 thread.

Tested on RTL8192CU (0bda:8178) on 2.4 GHz, with injected frames to an
absent station and the retry count from the TX report:

                         before   after
  31 requested retries     16       30
  40 requested retries      8       30
  default limit (48)       16       30

(before, 31 retries fell back to the default limit, which the TX report
showed as 16.) checkpatch --strict, W=1 and sparse are clean.

AI tool use (Documentation/process/generated-content.rst): the patches
were written with help from Claude Code (Claude Opus 5.5). It was asked
to fix the overflow found in review and test the boundary values on
the RTL8192CU; that test showed the second one. I have reviewed and
tested the changes and take responsibility for them.

---
Ahmet Zeren (2):
      wifi: rtl8xxxu: limit max_rate_tries to what mac80211 can pass
      wifi: rtl8xxxu: limit the retry count in the TX report

 drivers/net/wireless/realtek/rtl8xxxu/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: ae6b9e98b9045e47f609ec2a8197a3f3109627cb
change-id: 20261127-b4-rtl8xxxu-retry-b98ae3a5e5ad

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


