Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509218;
	b=ihJO0gghDN86DAwSlqbePkGugowC5DhPOXSyPWF1+sZRSdt+zQwaHE3LAbHP4W/2efka
	 yHDH0nbwWqEf9wf4T+cF76AGVMhTrIEvYOis32jVIjZ4aDDxp/NnN4fmGpoPkk23N523c
	 WQRD+iVAhe4ulm2f84yUaN9F1T5QQ99m4lW11uc7ISpTJH2iOc23RbRQ4reXk1V6ZlI82
	 LBmTwGVHdt2z8j+fHrBShGyLawwvuSY+pcfWy5Iga1bHXsZZAm6sf5Y0KKg7F3DkoPI3B
	 o5dLt0cb9P2fzZ+Z7mVGHC6xxpiNjPddbbP4CHOPLSU4wgOHgqvuT9rUcwV38dSJfDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
	b=p1pGOEQtwHOg3mM3N/RsB5xaYOE1NzWlDfvkwnHzUKoWtv4KWtFE6DhQk4lA84SanNFG
	 AwAQnXPSQ5y6OpZq0zJMUYWUnXFgafAYvLM/wk861BcSwnnMuhRp7SJyWjOUyvWTendcu
	 rN+s3b5OA8wkqba2aORL0ykkoaJxROM4FEfwIAIVKSWA696gB7GgtxtNU5SkLCxcSx9wx
	 VFBVwd6EJv81fgQT16Y4adVLJsS5JHKMPUs2jqId7lDgTNB6o7rb70lyFBkoQcGVBLnkB
	 efpdXhNxZtxscO1ZAU9obdMeei91PIU6iRxWYB6pgJj8QKwuJhqK4bSkE4J3867spig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="bkH3c/n/";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D574606A691
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D574606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=bkH3c/n/
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so6141254c88.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795509217; x=1796114017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
        b=bkH3c/n/jScsSPF0AtfJbwWKG3EGbh3eR9Oq9iW56tUWHAbE05TTA/jlR1Yzn1QKzW
         XVSWmcE95xz1B+mjnPaFbEVRwZqUeV5l7eqy52+L3OQYoNfHS+k5g5sMRwm6NZPd004i
         YVXHAspEaC1j6oJhKgUcSADHuBJFdX6QG34QwaNrkOYXntwP4VITflsxiOKvcGhnZubl
         vVHd/s546Os+2lu8fBGolT1yJP54gDwIQwj31laVTe+Bcwl7ook9mE5KHxJqtJ7xMUpr
         zHW4MSVddUNFrVz2cN1pUzQg9GYnHByCCQt+TqJ+Lff6JMDj+dMOa4zPC7l3blNlWrBs
         TgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509217; x=1796114017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHaPZxvGPPauklr++9jBux27Uh1MCS1CpxGOkczFd/A=;
        b=qtxOYiJonsePUo71+9O4q/ARvQTv4mE96ntTcL3E8AXpfV1Nhs7InnH6szhEIsteW4
         nWYOEXArP82+cG31j1Y9cdD6OkYiwaeNPzF9X6ONxpA5J260ZCDlCzGnOA5QsRRmiMMi
         MwCWeh00bejUAXqkyjh6Zb6IfCxpdOP2VazZh5lyYSh1cD9Y3F4yx50L5+CQ+JHdFXSE
         k6pjPc0IsWKQq745xZXdonA0zDhL6RGmefcwIeUE2MD4qmey6TR3v5wvPjhxvjmZ7H3y
         OWOq/9hF9R4ZpB1PbfEd7T9yzWcV+zHbVNuc9MXlk0coz/dfEEUQu4k2ueBZjF4KCpdp
         pbig==
X-Gm-Message-State: APuU4Z/XcvSzGEb5535R4gOCE/feyBL/mZbzhwIE/+u5fmuzKp9fmAJl
	8vSvkIhUNuhBmrXoOZL1mwNqnOmJaVBmeOrRe1q3sgRiKRBYe4cWffgYfX66lBW74A==
X-Gm-Gg: AZFdTZctVKL1Ipr2GAgAdL+U7MxEZhc9tHIep3fITs6kGPqD1DJLcJk2KWjd8Q8w8WV
	j+fHu/19bD0ixDigzhdgpw8p3rMiKi5nFwPwFqxIKlpY/8cLho7qXj3+tFKLGhBmxx452ppweSv
	t7udHEENOv9yIqKJCy5pGRBOzrph8d0sXP74W3ympWUPtAo0iyDwq0ra5UkijMc+UZ3KyXNpqQr
	DODxUr9MImoA+vZzliERBWLjoFom/2TMxVQ7T7gRIp1OKOrhvc8kxWxeH5vU+lc0BUWuxv4Zg/u
	Hyu8G/a3B/o0DhsxogrEf2eiUn7bj9BIT6P+rWuFQVKPJAGRsdlOWUH4CQjjE6Ahxn5UmfCi200
	cSrfZF9UuXNinErOunPugruZIbzYl+V8c2lOChddnQKX0za+bnvlLIFB3f/c1tVDzGCnEsg8fhY
	qCZQ4vc6OSHc5XfXtmdR6a+vgnCaMvrD4PweNuBi+8yK/iNtTd4r1MOwl5pPDZb5oTmkoKEJBur
	kCbKH5VbxI4d2W5hDDts2sd92+Jr/Cefn677Imos/OcUGHeo9fRXp3tB4M4IL/WFFcXzN20nTcl
	PnS5zTVCWUepQ3e7kPNzZrATK995yjbe+6KIiXQzJ3x0xTdp+kqTY9fru8AxJiEg8rPu0oicl3b
	O8yFKWA9pp/OB/Q==
X-Received: by 2002:a05:7022:7f12:b0:1b5:4dff:8b67 with SMTP id a92af1059eb24-1b5568eeba1mr14216791c88.29.1795509216390;
        Tue, 24 Nov 2026 00:33:36 -0800 (PST)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm32784012c88.15.2026.11.24.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:33:36 -0800 (PST)
From: Xiang Mei <xmei5@asu.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+3d9e2c65bdd43a254924@syzkaller.appspotmail.com,
	co+0b5d5f4d3472df53@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH wireless] wifi: cfg80211: don't parse the SNAP header of a too-short A-MSDU subframe
Date: Tue, 24 Nov 2026 01:33:27 -0700
Message-ID: <20261124083327.2037092-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
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

ieee80211_amsdu_to_8023s() bounds a subframe only from above
(subframe_len > remaining), so an associated peer can declare a payload
Length of 0..7, yet ieee80211_get_8023_tunnel_proto() always reads 8
bytes from frame->data. With Length = 6 and payload aa aa 03 00 00 00,
the rfc1042_header match succeeds on the peer's own bytes, and the two
bytes past the frame are copied into h_proto and delivered up the stack.
The frame length sets where they sit in the skb head, so the read is
aimable and repeatable. Injected over mac80211_hwsim (init_on_alloc=0),
the delivered EtherType is stale heap content instead of the declared
0x0006:

  aimed at object offset 410 -> leaked 7372
  aimed at object offset 410 -> leaked 3d31
  aimed at object offset 414 -> leaked 225f
  aimed at object offset 418 -> leaked 7573

With this patch the same frames deliver 0006. syzbot reported the same
read as a KMSAN uninit-value.

Only parse the header when the subframe holds those 8 bytes; a shorter
one keeps the 802.3 length semantics it already gets on a SNAP mismatch.

Cc: stable@vger.kernel.org
Fixes: eaf85ca7fecb ("wireless: add ieee80211_amsdu_to_8023s")
Reported-by: syzbot+3d9e2c65bdd43a254924@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d9e2c65bdd43a254924
Reported-by: co+0b5d5f4d3472df53@bugs.sh
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 net/wireless/util.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index ebb1f6ec7efc..0a0823d1d517 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -1034,7 +1034,9 @@ void ieee80211_amsdu_to_8023s(struct sk_buff *skb, struct sk_buff_head *list,
 		frame->priority = skb->priority;
 
 		if (likely(iftype != NL80211_IFTYPE_MESH_POINT &&
-			   ieee80211_get_8023_tunnel_proto(frame->data, &hdr.eth.h_proto)))
+			   pskb_may_pull(frame, ETH_ALEN + 2) &&
+			   ieee80211_get_8023_tunnel_proto(frame->data,
+							   &hdr.eth.h_proto)))
 			skb_pull(frame, ETH_ALEN + 2);
 
 		memcpy(skb_push(frame, sizeof(hdr.eth)), &hdr.eth, sizeof(hdr.eth));
-- 
2.43.0

