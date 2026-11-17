Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876622;
	b=DGAuNWRaxN0Hh6miSLcnU7qInLOhMeKrm7Xn8wlMnxnaS2R3O9ZaOS6/SGTH8818tXRD
	 cwHHf6bV4hNFzLbx0nZJxOlZF8+/GEMm2duc+6kND9HhpqNs4YlKi7qztelByx/SSAwhf
	 cNP2KDk7LfM/Oe57V9pce5lA80VzP5q9FY9zFuntG8J2DMFfiimskVSlPqa7jAb9KvjGJ
	 I2D2XCQUIJE/ShLSWVilPD7S0eEjo2LuMzsH96acwY97A0f8AqKWfMQbRXDL3KBhsxmOZ
	 VwjF65r5EM9k4ysnmUOCCtfrFFVREcoAZnXut+gQxZJthjj2J9VxwE0m4IOBSK9c08A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876622;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=AeWR1ZnJrjv79Z06dCxAT7bcFZY6XtYFN4mmbfPTD6E=;
	b=UL3ufeUwqjcfJqEW0qdnzCWtW4uUsXA2qNc1ESsZrDbcl5Pk1KXZwSzOiVxL3Nu3dqvC
	 nXWYbZaNskxj5dfEibqamtjnRgAlZcCPt3G/Vh9mrNKYmhzDsDRrGXiPG+Swg4dQbBcrn
	 kadvVbzHRUI5eLwD7EqbsmhmZ6PlDXWr6F0f5mdZ8XBoMfbth0k3Amel70Gj+1d0luJFq
	 ADrCvz5E0GfcNy/UfglnbKrFvIReO0PspLTpg+sQC1S1O/HwjUgxV0+MazObZQ1zZlECi
	 FNj2BPxt7vW7M+PNTj1jQX0U1bpg9X23pRvMvbp4P6gVlB4/wr6h9s/Wy5j56KMim3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSI3wxP9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C3606A31C;
	Tue, 17 Nov 2026 00:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSI3wxP9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9901F000C4;
	Tue, 17 Nov 2026 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794876621;
	bh=AeWR1ZnJrjv79Z06dCxAT7bcFZY6XtYFN4mmbfPTD6E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mSI3wxP9j5dH7LfxN5ShPDI45b65yMytt4Olnr16mxSZfPCTb1UcexTs3JO9pecN6
	 KcTFbpsDueQVA7jR17/xiPHpLgSOCgIkh95hv75DoJPj+S3kofOJI1rxG4gMRTC2br
	 OKqDlgj5EqEndehwopqPbNqm+egpxcWLc7+y5znVgISXAGWSZBKs2xs5ggYjucWm9K
	 gDjfmGw1G5zbRgmsG6HK9F75GqSfJ2GFR+5d0eH/7NSUR+I9XBHRJ+2cOPNRSitnSR
	 cZnqHciv+LwdfQpje20JUsoxKz+0Ch6/RLWNyRNCy9LVgb3PooGpH3z+zV0AnsGQ7C
	 2ahPmmo6IKoXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B439A391AFE7;
	Tue, 17 Nov 2026 00:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [GIT PULL] wireless-next-2026-11-16
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487662053.265995.6171718418421009808.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 00:50:20 +0000
References: <20261116122302.1501378-3-johannes@sipsolutions.net>
In-Reply-To: <20261116122302.1501378-3-johannes@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org

Hello:

This pull request was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 13:20:08 +0100 you wrote:
> Hi,
> 
> Here's a chunk of new work, partially I'm sending this now
> to not build up too much of a queue, but also because it's
> conflicting with net and I'd like to solve that.
> 
> Four files have conflicts, from what my test merge said:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] wireless-next-2026-11-16
    https://git.kernel.org/netdev/net-next/c/e1dd8486807c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


