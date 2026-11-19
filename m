Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126207;
	b=g/WvQkIJFfnlvquSQD3DiAmCMy6f3H18itcePy5XOb90OMWOvgPZPYKtWT5p9E60HxA1
	 GBEQb9sjfgcfyb4jkhNqtzbEb+JpLsVs/PJi0bPGOTarF26nKY8u79rtqVAP0I9GwsOE0
	 WKYG4LZ7pDmISnp6PmqtmyVTWJE6IfKphDqjNTupJr7GZBxP3+orfiIGOGu24nWTRrOEN
	 VwUvAtyWhcdS6sdqf0Qde4F8ZFMDg0pj1YbZTGD4nCvV/srNjCrXSIuA1oI694sNKLKNF
	 WMtgqc0u38g6CPoQlCytNhZsXPWMxbaHEVXPyDHDFc5WNRHcxqzjj9kTFNnkSo5RxVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=hlPU3sZhVUwnjKrwxg/N89sgqrZkBaaTp1xlR8QkCdo=;
	b=z+5a2awq/OI2O5ze00QhJ37uEdIeLT8dvtglJ90mrAoTUuYPmv2L42a/LbKy391sQJIw
	 sbwYoR8r165umJ/0FOVypZDel0e03Lb/9eXtaK6A1MSM35aBxmat9TgsaI0UfAzZaEAzn
	 eUjvxHnhVtYKnfStIcli2F8Jlez1nNvy6fV0tEx8zC37X1Pqzhik9LE3rczm8N6gBlQdE
	 Z2yXYXGzH12NmDSAophPFpULMVVrl8MUJESb0GTKF1kKyWvYag3kOab1EgNZrAP7SeupI
	 K3l/GgjaknUaq/vWeZV1xfjbWtd3TdUtIvIp7waoKRGx9hQYSiMU4OA3t8cufDfDaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TAj/ZXx6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD9606A335;
	Thu, 19 Nov 2026 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TAj/ZXx6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CBC1F000C0;
	Thu, 19 Nov 2026 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126207;
	bh=hlPU3sZhVUwnjKrwxg/N89sgqrZkBaaTp1xlR8QkCdo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TAj/ZXx615jsjL5Z/IWmaK0EvDf7E0hYB+VzLswAlBU1QY2GXtMRZIA+rHmD+vr5B
	 ELx+gTK4Q4vCemJUOvpoXAwUswSxzFnoO+iJ5n1iLsvppldQWdRRQ1Usiyy359So5j
	 p5j638brwqlulOtd/zWVdywxZkkJY+tF06hlqQs81Dx3h3J7JQ613Y3uIKa2s9pdwi
	 gxT5y2gwcDaVToh0VbKUp7nAqfMXChiibg1ziGFdn12VTHgOFfyfq3hSVmMN3KvFrc
	 aHSi3RRjCEaJ0PPBjTc+y40dXaharMxdqNNfzKtpP6yYr/JxzasXzrCnjT+j9Z+rlg
	 gDQazpNqYw9og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A41D3808209;
	Thu, 19 Nov 2026 22:10:07 +0000 (UTC)
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
Subject: Re: [GIT PULL] wireless-2026-11-19
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179512620603.3888839.8901800817499638079.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 22:10:06 +0000
References: <20261119153408.342115-3-johannes@sipsolutions.net>
In-Reply-To: <20261119153408.342115-3-johannes@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org

Hello:

This pull request was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Nov 2026 16:33:27 +0100 you wrote:
> Hi,
> 
> A bit late, but nothing that's urgent or would need
> to be resolved with net-next/wireless-next soon.
> Just a couple of driver updates, still reviewing
> more core changes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] wireless-2026-11-19
    https://git.kernel.org/netdev/net/c/dcf495789037

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


