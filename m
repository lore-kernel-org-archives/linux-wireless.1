Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088698;
	b=kPT1j2GTvkMiUbvjKsG6e4/SIWV253QozFmwBwKMVVprRdphD6tYF1iLW1DaUhUhg4m8
	 HCBAkM2Jai3hthMRJf+DVoBl0hEjDj5q47QKdMxCpmiEKTFam6/aqOeiew+x862c8fzD7
	 uw7A1l1kNHUzJ3SDahNOFq9SUwI7k4SHOgohDox018gl8fKK9qPg0Zx2nrMAWGc8EjNtX
	 lnp2O1xsaiqWWWPkO6Kdy8EgHLss03gV1eFv7XkknNl1JSq8PzhaMm7ObQyF048f3Daci
	 U8HWXR+4TX80OZCfEFpIGEnykC+l5E+MV78GoMu3sWtg3lVlGF7ngOfqY4/UFWHa1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088698;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Developer-Signature:X-Developer-Key;
	bh=HsNckeKw+/HofLlp/+Kawk03SKQnjPvKLk3DUi8Ikv4=;
	b=dEnfTWZt7yMTnSmHhJdjrBuyLrPZMKzlhwxeyIcu9Ln9de7d2RqfV7vcC+8amE5zmirS
	 b0q8ae9i3BOp+OV4pzsgDlVFxXHFrMcuR3AHJVD2BbIZXFPJ16ZDoQ8PkXiKMgkZoX1IC
	 T1Hj8eGxCjn4Uf4aetSCCbg61VZvgKRwFY0r7kusLusDeIX694Uh3MntzrH+sKl23fuqQ
	 39YXHRUA2AX1DBfn26kM+wsTRDPus9vajWSFhlV/WJnwyyC+85g3ca0u7R+fraw/m+Hoz
	 p6VBSbAagzhTdBFmPNs6I3f/uTXIG9k65YWmcyXTOs6k3HLb7NtE+z66t1jdm69179g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=Qv4cGZ3h;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63281606A320;
	Thu, 19 Nov 2026 11:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63281606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=Qv4cGZ3h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795088695; bh=lBMXxis/S/6k9yW3KB8TtSvBObThG27wCCGvSxiRAmM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Qv4cGZ3hFLe+DI3Ge1eqg69dsXJ7FA7Srb/PJfp7HZwcQcsfzTFgyMp7tmvFBsrJx
	 Y/uYZfFWg5pi55WI1fZu7HrcWMW4i0686u4r19OuUz5aYKQf0/npKY51jHugYo+1qq
	 pay015kmrLmQgkccCaaWZ+Rajqvq6ZkVUgoenoCFgVmamJ+vSG8EN08h0ce8+0ILYu
	 1ttdB8muH2nwsBA82sEkAaTOjpdxKEQGTB5f28SDlHGzqD9WduteIcfTiKlXbQQl5e
	 kpWGuUd3qUcMi9lX+wDuixevMMmTCWFgFa+KoPuTxA3W14RywZae685NwNZE1ZtSKR
	 RwBYelp4FS3bg==
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
Subject: Re: [PATCH] wifi: ath9k: restore background spectral scan after
 reset
From: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Nick Hainke <vincent@systemli.org>
Cc: linux-wireless@vger.kernel.org, 
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915194327.30397-1-vincent@systemli.org>
References: <20260915194327.30397-1-vincent@systemli.org>
Date: Thu, 19 Nov 2026 12:44:50 +0100
Message-Id: <179508869077.131763.40673485118239980.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=643; i=toke@toke.dk;
 h=from:subject:message-id; bh=lBMXxis/S/6k9yW3KB8TtSvBObThG27wCCGvSxiRAmM=;
 b=owEBbQGS/pANAwAIAUNeEGz1+utPAcsmYgBq/uE18kbnYhd3B0B2BvW3xlCyD6yLyga34QP2X
 bsy3nTqrMuJATMEAAEIAB0WIQQQshMTMFJycn1q0JtDXhBs9frrTwUCav7hNQAKCRBDXhBs9frr
 TzxOB/wPS2sX1fc0LalpNVi06tMeZr3x4QVdoszw7SwzKiTYyNgspPwHdoCYX+9QqIIpzGMQNa/
 dGco7YTY2Loz2+PY03lNsUgRVPehPIvWFEBjGNBi3lpSmq/1pjsne6na7sK1PzC4rJRXJ8MPMxS
 tYk46giPumuQYGHfx8VZ5fbSRxVztp5yttm2+prGd04XBj9LiW5oVbp+JJ1kPZuuVHcJfRs+jvz
 HjDPw6PN2kdJqndNY3UyUS7qKYZ2unDlBH4gxB8Ef4Q8mMTm7erCrf1BFrZN9LH9dg4fVpnbqdC
 OMDvxN8zqOHLvoFu8gvyYMnw8p3HBd+1429VHiET7PsCFwl3
X-Developer-Key: i=toke@toke.dk; a=openpgp;
 fpr=DE6162B5616BA9C9CAAC03074A55C497F744F705

> A reset leaves spectral_mode set to SPECTRAL_BACKGROUND, but resets the
> spectral registers and receive filter. The driver therefore still reports
> a background scan even though the hardware no longer produces FFT samples.
> 
> Re-trigger background spectral scanning after reset recovery so the
> software and hardware state match again. Do not re-trigger spectral
> scanning in disabled, manual, channel-scan, radar, or off-channel modes.

Looking at this again, it's not obvious to me that the right thing to do here is
to re-trigger the scan. Shouldn't the reset just set the state back to disabled
instead?

-Toke

-- 

