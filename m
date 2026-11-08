Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.76.27.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172409;
	b=hQrz4swFmJpj/eJIMuF/23dWbhRczK0GwztD2kT5qHo8nvQiwUzzRPvwGoUrQDeV1iqu
	 YOu9LxrJly2mVlEQJKOz79mOdyD54p94Nzggv//bJcYreTYmt2zjWPDJPYpScurd+xWhy
	 /ZjQD+kdS4eLjrmUqoyGm07vqHUg5B6bTY6EnkEs0eSmNWv+JaYZGEWSywZEExlsifu4X
	 xnrT1Tie5vBXR/Yd1ftNLRBe5KE/aFC+p6vIcw7PbUgyt2Jmtozunb3WIPGc0LbVdl5Fw
	 M5tVN20fnML7eZEAbqvmkmGwzBEq3nGewUQBsSFt2qGdNQQgqdEbYYtZqUrfuoXpHBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=f4SXODYt0dqE9gpAJFaRCGG2pc30CKRO/nv4aNXoQa0=;
	b=KrtpVnamN8cRtud1qEIybpLgQF/NCKm31QbDso5PgqzjkKfXwJto/+Xz6UVeeL+IOU6B
	 4cMb9KJEqw8IuPE4E6TfrNE6rOrEXAKXdmP9yqPkLvSX+jNMbN/PweL2RABoa6CJYNxQg
	 Rolttb9jEVXS74MNMv2Knaf4sepjsR+9FJJLTD4uqsgckFjREVvSqV6kiL9yuLXbToI7b
	 GaeY7b3nWoLQitTI0b5re+8Qn+QlHo/tclby3AVMC5ogiho/jeAQ46yPH9eCs2RGIOFAo
	 UMRV/FyQBHk+wDqzy+USH9PChXsarlTaV36+VaZGuPmOdNt7VmKaIbaSvduaiAsO8Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrei-z.com;
	spf=pass smtp.mailfrom=andrei-z.com;
	dkim=pass header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=cexcCYcI;
	arc=none smtp.remote-ip=82.76.27.144
Received: from vtj.irix.systems (vtj.irix.systems [82.76.27.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE778606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 21:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE778606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=cexcCYcI
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id E08DE1637;
	Sun, 08 Nov 2026 23:13:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=f4SXODYt0dqE9gpAJFaR
	CGG2pc30CKRO/nv4aNXoQa0=; b=cexcCYcIgWn38QQsMEUfG2fnMJfgENQvhh6s
	VdkqE3T687S3krT/sYExad0NAr80C6Wy8G5bSuO+113bgkASYl2s2oQIKy0J2Yw9
	VMzDxqQ1JaAaL6ikBB6TaogyDN0FX4RrZEKdZOagbfzI0OtAQGpdkWe1ue3lHCYg
	bL9oFhEqKgzUMFKmYV/S+/A0l1IJKDLOHIFcGPU33Z4nO1K3Pe/9JNPhnuOi50fs
	L2hnUApUTqFi9Vkwf2isrrxZ8ls49u6ep3unxMos0ZZBxyRTL48URp1gfctXh7GC
	qDJq+Fke8U07psdEpcqhcpz6D1suy7rQZC4laiduVBmkWYqDlQ==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id B27681649;
	Sun, 08 Nov 2026 23:13:20 +0200 (EET)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 23:12:59 +0200
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH wireless-next 1/2] wifi: mac80211: notify driver on
 airtime weight changes
In-Reply-To: <f1c38f69fbc43dde6be805ef140837bd201187a3.1791111135.git.me@andrei-z.com>
References: <f1c38f69fbc43dde6be805ef140837bd201187a3.1791111135.git.me@andrei-z.com>
Date: Sun, 8 Nov 2026 23:12:59 +0200
Message-ID: <179417237927.1177342.395378810604553938@andrei-z.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)

Hi Johannes,

I see this one was rejected in patchwork. Was that because the op
has no user in wireless-next? Its user is "wifi: ath11k: support
firmware airtime fairness", which I sent to ath-next separately.

If so, would you take both as one series, with Jeff's ack on the
ath11k patch? Or did you want something else changed?

Thanks,
Andrei

