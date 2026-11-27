Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=125.209.209.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791540;
	b=LPryg2vG8n62BaT9c0Z9Z0tO2PWTmXeOuaJzYvS9I3u4yqIweoFyILNL/aScaFGUc5EU
	 hpS00Jv5O73u1uVZdv9I788PTDC6dUWDeinawmQQWHutNJoWuUTaIRiclPHnmIZtXUusj
	 U4xIS5toZEYJmdiaKbzPNfbiuMJ6xPC9QW6R2DE+nIEkWVvYRqmEkhP4++rIkohky0Xvs
	 wYTgnt3hBo3IfHFuhBBPSerHBz4RCwWI/eEtnE3Q0PrURYHt3kiSy8jZ1NfImWjk0rRoV
	 IYzuxc6TL6fdQEl9CeSpIOuHFlfw2C7l18QZbt0NTO/JVzufxW+e5Ia4PX1xIzhy8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791540;
	h=DMARC-Filter:DKIM-Signature:X-Originating-IP:Received:DKIM-Signature:
	 X-Session-ID:X-Originating-IP:X-Works-Send-Opt:Date:
	 X-Works-Smtp-Source:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=RCboUMknZX9KUpA5ubkiQr87yrWnGqiDVRnNwAqX+ok=;
	b=gEX7KetOt43Djqlhzb/jYCuX5WKxrLXSUUYhNuRDV4TcJzHFB0vLqlHnKEEAC/DoKxqL
	 mFkWIE9JdeC58X0ZFVl4jDc7q5VAu88Gm7RThX8+4aUFHcgkAV/qWjujgv++UfA1cJHXT
	 tXvXlqEqP4qF6ft3bX0QxrXFzPb3CSrsP16Xrt77ArFKIq5kf3bIEE0e177mTIxu3CAJY
	 /Gttp54fGbYd7sM1lWG9qpA2Zk1medOv5rim6g8mGRcyByicXEI9T3tRF1nm7iA/QGK+/
	 uK2WDFfwjIO6fPrC4wc+tVWm9nDz0MbddgZ5h/2Hk2uxsCqgWY1C7/pUT7JbRpH4s8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skku.edu;
	spf=pass smtp.mailfrom=skku.edu;
	dkim=pass header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=O9w6uAUp;
	dkim=pass header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=oBMd2XZF;
	arc=none smtp.remote-ip=125.209.209.46
Received: from cvsmtppost102.wmail.worksmobile.com (cvsmtppost102.wmail.worksmobile.com [125.209.209.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30644606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30644606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=skku.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skku.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=worksmobile.com header.i=@worksmobile.com header.a=rsa-sha256 header.s=s20171120 header.b=O9w6uAUp;
	dkim=pass (2048-bit key, unprotected) header.d=skku.edu header.i=@skku.edu header.a=rsa-sha256 header.s=naverworks header.b=oBMd2XZF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1795791530;
	bh=RCboUMknZX9KUpA5ubkiQr87yrWnGqiDVRnNwAqX+ok=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=O9w6uAUpAH50nHkb+jo1eEnNA3b+iEikUaDYfgEOfIFIb3p+pNMNltyxFC/tw9k6c
	 R8ABn9cJzyBc6NEyn/tn7hO7pIaP7nm4aMb1NwYmkb6ss62GhYCoTlmJuOYmr9T2Vu
	 H+/ykS6UJSyw31l5ZZXqE6sQoJwNIunFYCXDXPQyoFmBK8ZT5Rdaq4IW9lCZK8+qVv
	 if6b2uIkDbJlHrpMmKyqL+UI1uVCJ9d/LoIge5/5PeBzIfrdzYS9ohmIggeAS6cUgH
	 epiFJCuJ9slWlUe63vrl1MvX67FDCg6JX+kJPpiFiBIIP8NNg52aDQ/KaRJhOcC3jI
	 U+kZqDnTbsZ2w==
Received: from kr1-hmac-real-1 ([10.174.201.129])
  by cvsmtppost102.wmail.worksmobile.com with ESMTP id 59fGDlneS-mCOM47WtVlhA
  for <linux-wireless@vger.kernel.org>;
  Fri, 27 Nov 2026 14:58:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=skku.edu; s=naverworks;
	t=1795791530; bh=RCboUMknZX9KUpA5ubkiQr87yrWnGqiDVRnNwAqX+ok=;
	h=Date:From:To:Subject:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=oBMd2XZFQXQ4MQ4h1KrDlLQMrUy7tT2UtdaUltbf1q0Z5Y6GwzP9HZLYtCNtEvUlK
	 tQh7xY3iYY2sHUhlOKptXlIBsfgp28hVPQd6oNxbhIiNwS96m7QMzdZ4ybiFQr9ofU
	 JFbgvtlipkWw2Z2UEdoFbDqFFjkni5CMZCEgM5i09lUTUX9K3AMQ/6fO6S0jdMV3ye
	 Srw3sG14ttzBX9SUAmXQVV4kRNAPOUqwFiwrSz2qpQ08VdC4uhOLo53TKYlgyiNHeX
	 5BDpxmjE07KldJVV9YU68kTlzTkRBe7Zcu7Ba+gJDLrE/fFccjkIVk+a1ItDZCj7B1
	 oOclKme92R9Vg==
X-Session-ID: WOD8dyZXT8a9wx0aiYJDYQ
X-Works-Send-Opt: w/KXFqgmKAKmKAFYKqMqKA2mFAurjAumKAgmKxEmKqK/aAtwaBmmjAFYKxM/axKmKo2rFBwYjAg=
Date: Fri, 27 Nov 2026 23:58:50 +0900
X-Works-Smtp-Source: VZb9FqElFqJZ+HmmKqul+6E=
Received: from [172.21.0.2] ([115.145.173.180])
  by cvnsmtp103.wmail.worksmobile.com with ESMTP id WOD8dyZXT8a9wx0aiYJDYQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Fri, 27 Nov 2026 14:58:50 -0000
From: Kyuwon Cho <kyuwon.cho@skku.edu>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: mac80211: set up the TXQs of an AP_VLAN
 station with the AP's vif
In-Reply-To: <179575981569.1588942.8945055698942160441@skku.edu>
References: <179575981569.1588942.8945055698942160441@skku.edu>
Message-ID: <179578856568.1978762.4298948430081637213@skku.edu>
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

Please drop this patch: wireless already has the same fix as commit
6acf038efc45 ("wifi: mac80211: use owner vif for AP VLAN station
TXQs").

Kyuwon
