Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876343;
	b=Wwkhzu5r2PbUGjAZCoQkFi8mlnE5wY+GzrTvkkS0WYm7+w6oRQcn1rHElMX8662ysIX/
	 edvn/oU89t+nN9COO0iUQ512Jenb5URsLLuef/DWsdqxNPBjMWJTdze3M+KFnyC1loyt6
	 hhiQChPfQOZjbAE/Mw1xKAhBKr7UiL3O0mCh+LlinBjf4eEuml2DV/XtFVreCQnlDwjpQ
	 SixOz6z60lSpKSDC2h5MAS0UNRN6VAvC//gIal88DWzBXUOincZKR8orCmr1KoQ7zk4SI
	 lLzYzow3na7g/ieMySs5qXwYlvLTsFUmtrEk5pw2wNTACYakNdvRRZJ+YY2+jx0F6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876343;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=noljbUX/VThb4fr2sBKGxQKmiG1tVKJPJOeQDSwiGCA=;
	b=wv5TWlsuNVl4K+gXviLvH20EVsJxTXBsnP0kfNTlP7WMB7Q5j2DSKaOyR+cxCqRoMmVL
	 OrT5szTeLQT4f3R5qxOu/gkUSb3/8pV9hdpwe5tzXqNEcnPp0OY1M69sf+ofhC4ClRrtE
	 f78QIViCuGhPHvZRPEkWUcrOSQBdkeLJhaWwqhFzjEjy5jfGH2F++iWV+ad62rmO9ESqB
	 ilVZtyD6PWGSbFj2O/p4gFjF3U09T2wmYA+AnhVsWXzSz3aYW17Z1arDrzg2g2BWYy5MU
	 iMlH1nQE2YVjgk0W3pkGe+bpR0jmTlR3qDyrF7ndjYdWj4yqcXWqjuNbk+UQM26KJgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGb95pGl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4C606A33A;
	Tue, 17 Nov 2026 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGb95pGl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ABA1F000C9;
	Tue, 17 Nov 2026 00:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794876342;
	bh=noljbUX/VThb4fr2sBKGxQKmiG1tVKJPJOeQDSwiGCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OGb95pGlTAb7DRhQexHalzLvVeH0CH5G22dC+Nnne/EOpY0gife49mUn+HCcHsXfl
	 exhQqITywzosNkiX7Kie6//VZOuihdYoNX+lXQgXlXu1/qrGce52s7VqSeS4DLnIdM
	 iuglDz7BoJL2hjVj9iMo0XAs7jqqoY8iE0L+FA2qtB3FgijrylX4p0h29dyOM5a7xA
	 jh4JZQgV5bmH62lWy0NinW4YKwlgejlVGL2InQmisbBufFQgQmCEAQOKM72acXc1gm
	 Wp5Cbzj87Bjv/t8MNg258XZrwuZADJCw0BexsY7XF7FRLrd8Mm4o0582yZl2IBaOII
	 tieg7D3SdxqRQ==
Date: Mon, 16 Nov 2026 16:45:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [GIT PULL] wireless-next-2026-11-16
Message-ID: <20261116164541.3adf8979@kernel.org>
In-Reply-To: <20261116122302.1501378-3-johannes@sipsolutions.net>
References: <20261116122302.1501378-3-johannes@sipsolutions.net>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 13:20:08 +0100 Johannes Berg wrote:
> net/mac80211/link.c
>  -> two conflicts, use the new version  
>     (the sync issue was fixed already implicitly in the new one)

I shied away from doing this and followed Mark's resolution.
AI wasn't convinced that taking -next is good enough, or maybe
I fumbled the edit.. Either way, I assume it's more expedient
to do the merge the way I did and let you fix up on top as needed
