Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.71.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036273;
	b=OFWn0yuN7HDro/G6/n8wydExbSNMxcZc1bJ4EyuRL9uK1A0uC40m8GIuKWJ15K+dBYtS
	 HMx911TCZc+ZF4CecNnH/Q8pOBH3Y9G/38zV4I0hletDIfz/GjvLKpAzv9o18fA31JYNp
	 JA0y4QLcPAICrWhs58CY+AxHtgzb0J+mIcY02K3d5JQmLRFGQVMuX7mTdPDb2DiCUOCOL
	 lbYdvv0/JmKwqKFvcW45wChW3WGyHfDfyVe0Ge1v4HivLtiGlyy2F/phtmKEbLcl6QHdx
	 UzraTeiIV/8DJJjZLDzws5tQWZB6nWGnlMwUROtNMgptCDW/JXx/WdOAhxm6l6uJ9Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036273;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
	b=MTufHzcYqyCvWY4eI2uuaOwkjcs+Mzz7qkRgXQ3OQm+uotrN0uQc3AeUtxwZxzWrgdvn
	 Q6V9Eqf615v1Qj+UJbp3fqwpPnqIIY2QhsaeUI5deSU5gcR33COkfHS1jcvbdXRQahm/O
	 sk4DuzJlPdg6d852LAn/ksX7Kz6XvxA7FAe8CwsQDDiyPgWa74tUTaY6Uf6jpwD7PKGG3
	 LUHS1tA4E0v0Jprff+sYymiRBc5TRSYDsWs+PPCiEdsHtWBw8cxaDpymCe7eYZjxyqAry
	 9aT+E9ZopP41q/PSdUPwtKH+69IqE6XdFd49foc1GByqSPXUpvyr3N1ZsXZ1BHWNw+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inlimbo.org;
	spf=pass smtp.mailfrom=em572954.inlimbo.org;
	dkim=pass header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b="Sjew/7Y9";
	arc=none smtp.remote-ip=170.10.71.186
Received: from a5i186.smtp2go.com (a5i186.smtp2go.com [170.10.71.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18112606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 21:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18112606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inlimbo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em572954.inlimbo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b=Sjew/7Y9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inlimbo.org;
 i=@inlimbo.org; q=dns/txt; s=s572954; t=1795036266; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
 b=Sjew/7Y9FWCrI9MnyuFuAtZypr7H58RdFsgNe99zN1OIdXhx+Dn9fuHtl2zpOFO0Oc9JB
 BiT+dYCWTO5Z59oj2MK3OohELnNJoCrBFF8Cxkw1Hjpun6tdQAN/30wY9VUhw8RglQHVEKh
 ngP2lqVpDj1McLdjY0PVV2RkSIAwdoso7Pj8biaLf4ODbcKuJaVFcZNZpIJhUHR72dBMStP
 8Pk87579UmyNqNCvPdtFns+Xds4y3jHjlQpc5cCzxwP6Pyt6/Xlevb3bYLmsVMjqW+0Gy9+
 MpyCUJbZrzsOBhWv6cM3yXZDIB+bMwBvjI60g4k1C6e85MrcVmldkyzdZk2w==
Received: from [10.4.240.50] (helo=franky.home.inlimbo.org)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <blaz@inlimbo.org>)
	id 1xTmvl-AIkwcC8skKF-rKVI;
	Wed, 18 Nov 2026 21:11:01 +0000
Received: by franky.home.inlimbo.org (Postfix, from userid 1000)
	id F14AE460072; Wed, 18 Nov 2026 13:10:59 -0800 (PST)
From: =?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
To: dev@deq.rocks
Cc: Yossef.Osman@proton.me,
	aditya.garg@linux.dev,
	arend.vanspriel@broadcom.com,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	=?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Wed, 18 Nov 2026 13:10:37 -0800
Message-ID: <20261118211037.11870-1-blaz@inlimbo.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 572954m:572954ap6fYNW:572954s9s1FY5vC9
X-smtpcorp-track: N5PiM2nqS-pR.oSN0ZMGDgCYR.ocmhnwjifsP

Tested on a MacBookAir8,1 (BCM4355/12, firmware 9.30.503.0.32.5.87,
board_type apple,hawaii) with kernel 7.3.4-3-t2, replacing the t2linux
9006/9008 patches.

With TRACE enabled the driver logs "Skip ARP/ND offload enable on Apple
BCM4355" and configures ARP and ND offload to 0x0. With the firmware
console on, the "EL: 38 5890" errors stay at 0, idle and under a
6-stream download. Throughput after a fresh driver load is normal on
both IPv4 (260-301 Mbps) and IPv6 (248-336 Mbps); without the fix this
machine is stuck at ~50 Mbps right after boot.

Minor: the code comment says "IPv6 downloads drop", but on the BCM4355
IPv4 downloads drop too, as the commit message says.

Tested-by: Blaž Zupan <blaz@inlimbo.org>
