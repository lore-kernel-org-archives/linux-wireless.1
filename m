Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423992;
	b=UAwDD4t/m4Ac+9P0JJvbkmXmvQCtSv3kY4b3mf6lZWQRGpHeY1xKl+NqdPdOi1+SA1mm
	 nCyEki2uD+0GzBR4WBjfI7VpEzj/Q1pCMYcyzPsur7T3poJeEWdzGHTPlio+uzHpMrMFB
	 exuyo4v6XmG/WSrcyb/T9qrHmvAqfKpMtmRE6WR88kS6VHylfGw/QgPFWDwVqsyVbqldP
	 OYADmv7uky2xdBFW6DlM1PTq4l8UXbEWjkEvkKJyJjYrhzsSJoBM2Pv3ytKK7eHYawjKi
	 h+thnUJIDPDVubzTZDeYQtjpbykbj2MRe9gxvdC63XAJDtqpw3LeOgZJZNLrEUhYMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423992;
	h=Received:DKIM-Signature:Received:From:To:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=IdQvuSRc3Xg3pnZ1oIUi9v1PoWgz+Q/dImBt3QuWkYs=;
	b=GOGKZlytd7/7vbUTcOSI+FEtcK/kdztkUVCSGDMyN8FtUthEaYqukn+V5cCFIcJOGB21
	 gY6XiGjHXSzWJZ/E0MBJWgKWmvn+MRXGWjA+kfgFukPfguWWRGIcsSZUTK2sFbOTlQKG/
	 bn93Vr8lNzxMcmPohrptEZSw6R61QATwmJOViP14FUVrbOlsYPOifHUs/JjgD0TW5vYPk
	 YwNF8OrvyORKEPhwutaVmX/5VRTUVXxKmEL94Lin1POB8896m5YR5S4rK0hBPyXr53yUW
	 o3br0aD3o/BO1LTEpChjzHoVG6C5iEJw4v+RF1q4XTCcEsBRXU9S/NUe7+jA9JCMoog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqfIKGCN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F8606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqfIKGCN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336111F000C0;
	Mon, 23 Nov 2026 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423991;
	bh=IdQvuSRc3Xg3pnZ1oIUi9v1PoWgz+Q/dImBt3QuWkYs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=AqfIKGCNagohgfDjReejktPMwCr6B1SbxkGoi8/sautMg6SZ1SmWawtCdaesdCFdG
	 s7f0gEkX6JrStqhUGql+R5YXYhVm+gWwKWjJNUVBULxEvvJJq/dnqzTC1nmThdvuDG
	 m0iprMeVRTHs1dXKXe7P2rn5PmoKbWrzt5t84AwfvT/lJZajCZxwbQabQcjpTtOS2j
	 3XvY/+geKxF3hHpR4/+LgimVsCtHQZbNEPIN6ahUHYJOv/fEJGmbx2sh588b5huSzh
	 h0cGHvngNFFH3iiOfqIgANHs1DqbiWRe0isWEa+R/fRjfV+jjkSdaWM6mULFHktIta
	 Q1fQdrFRJkUrQ==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E11E75FADF;
	Mon, 23 Nov 2026 16:53:08 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: wireless-regdb@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Ahmet Duran <ahmetdur10@gmail.com>
In-Reply-To: <20261030212108.24494-1-ahmetdur10@gmail.com>
References: <20261030212108.24494-1-ahmetdur10@gmail.com>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_wireless-regdb=3A_Update_regulatory_?=
 =?utf-8?q?reference_link_for_T=C3=BCrkiye_=28TR=29?=
Message-Id: <179542398889.943792.16243736225845003569.b4-ty@b4>
Date: Mon, 23 Nov 2026 16:53:08 +0800
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Sat, 31 Oct 2026 00:21:08 +0300, Ahmet Duran wrote:
> The previous reference link for the Turkish regulatory domain is dead.
> Update it to point to the current official regulation document provided
> by the Information and Communication Technologies Authority (BTK).
> 
> Also added a fallback search link to the BTK regulations page to ensure
> the document can easily be found if the direct URL changes in the future.
> 
> [...]

Applied to master in wens/wireless-regdb.git, thanks!

[1/1] wireless-regdb: Update regulatory reference link for Türkiye (TR)
      https://git.kernel.org/wens/wireless-regdb/c/53c64e32481c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

